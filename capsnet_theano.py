import theano
import cProfile
from theano import tensor as T
from theano.tensor import nnet as NN
from theano import function
import numpy as np

def relu(t_in):
    in_size = T.shape(t_in)
    zeros = T.zeros(in_size)
    results = T.switch(T.lt(in_size,zeros),zeros,in_size)
    return results
    
def softmax(v_in):
    ex = T.exp(v_in)
    denom = T.sum(ex)
    return ex/denom

def squash(v_in):
    sq_norm = T.dot(v_in,v_in)
    norm = T.sqrt(sq_norm)
    factor = sq_norm/(1+sq_norm)/norm
    return v_in*factor
    

"""
handle the transition between convolutional layers and capsule layers
since convolutional layers are scalar valued and capsule layers are vector valued
we solve this by paritioning the convolutional layers into groups of size ratio
and interpreting each of the groups as a capsule output, which is then squashed
"""
#batch x cnum x height x width
def primary_capsule_layer(im_conv, w,ratio, capsj):
    #batch x height x width x cnum
    im_reshaped = im_conv.dimshuffle((0,2,3,1))
    #batch x capsi x capslen x 1
    im_dim = list(T.shape(im_reshaped))
    im_dim[1] = im_dim[1]*im_dim[2]*im_dim[3]
    im_dim[2] = ratio
    im_dim[3] = 1
    im_reshaped = im_reshaped.reshape(im_dim)
    #batch x capsi x capslen
    im_reshaped = im_reshaped.dimshuffle((0,1,2))
    #squash
    im_shape = T.shape(im_reshaped)
    im_flattened = im_reshaped.flatten(1)
    im_squashed, updates = theano.scan(lambda v: squash(v), sequences=im_flattened)
    im_squashed = im_squashed.reshape(im_shape)
    return capsule_layer(im_squashed,w,capsj)

#batch x capsi x ilen, capsi x capsj x jlen x ilen -> batch x capsj x capsi x jlen
def capsule_layer(u,weights)
    #[ilen] <dot> [jlen x ilen]
    udim = T.shape(u)
    wdim = T.shape(weights)
    def batil(u_b, w):
        def dotil(u_i, w_i):
            results, updates = theano.scan(lambda w_ij, u_i: T.dot(u_i,w_ij), sequences=w_i, nonsequences=u_i)
            return results
        results, updates = theano.scan(lambda i, u, w: dotil(u[i],w[i]), n_steps=udim[1], nonsequences=(u_b,w))
        return results
    results, updates = theano.scan(batil,sequences=u,nonsequences=weights)
    return caps_route(results)
#batch  x capsj x capsi x ulen
def caps_route(u, r=3):
    b = T.dtensor3('b')
    v = None
    for i in range(r):
        #softmax
        b_dim = T.shape(b)
        b_flat = b.flatten(2)
        c, updates = theano.scan(lambda v: softmax(b),sequences=b_flat)
        c = c.reshape(b_dim)
        #sum
        #batch x capsj x vlen
        u_sum, updates = theano.scan(lambda u_b: route_sum(u_b,c), sequences = u)
        #squash
        u_sum_dim = T.shape(u_sum)
        u_flat = u_sum.flatten(2)
        u_squashed, updates = theano.scan(lambda v: squash(v), sequences = u_flat)
        v = u_squashed.reshape(u_sum_dim)
        #update b
        bat = theano.shared(0)
        u_shape = T.shape(u)
        bat_nums = u_shape[0]
        capsj = u_shape[1]
        capsi = u_shape[2]
        
        def caps_route_inner_loop(bat):
            bat = bat + 1
            #capsj x ulen
            v_b = v[bat]
            #capsj x capsi x ulen
            u_b = u[bat]
            j = theano.shared(0)
            #loop over j for for u_b
            def caps_inner_j(j):
                j = j + 1
                #capsi x ulen
                u_j = u_b[j]
                #ulen x capsi
                u_jt = u.transpose()
                #implicit ij loop with matmul
                return T.dot(v_b,u_jt)
            results, updates = theano.scan(caps_inner_j,non_sequences=j,n_steps=capsj)
            return results
                  
        b_deltas, updates = theano.scan(caps_route_inner_loop,non_sequences=bat, n_steps=bat_nums)
        b = b + b_deltas
    return v

#capsj x capsi x ulen, capsj x capsi
def route_sum(u_b, c):
    results, updates = theano.scan(lambda u: T.dot(u,c), sequences=u_b)
    return results

class capsnet:
    def __init__(self, conv_size, conv_arch, caps_arch, primary_caps_ratio = 10):
        image = T.dtensor4('image') #n x 3 (rgb) x height x width
        
        convlayers = len(conv_arch)
        capslayers = len(caps_arch)
        
        convolutions = []
        for i in range(convlayers):
            convolutions.append(T.dtensor4('convolutions')) #n x num_convs x rows x cols
        image_convs = [relu(NN.conv2d(image,convolutions[0]))]
        for i in range(1,convlayers):
            image_convs.append(relu(NN.conv2d(image_convs[-1],convolutions[i])))
        
        weights = []
        for i in range(capslayers):
            weights.append(T.dmatrix())
            
        caps_layers = [primary_capsule_layer(image_convs[-1],weights[0], primary_caps_ratio,caps_arch[0])]
        for i in range(1,capslayers):
            caps_layers.append(capsule_layer(caps_layers[-1],weights[i],caps_arch[i]))
            
        self.ff = function([image,*convolutions,*weights],caps_layers[-1], mode=theano.Mode(optimizer="name"), profile=True) #compile
        self.convolutions = [theano.shared(np.zeros((cnum,conv_size[0],conv_size[1]))) for cnum in conv_arch]
        convis = [conv_arch[-1]/primary_caps_ratio]+caps_arch      
                
        self.weights = [theano.shared(np.zeros((convi,primary_capsule_ratio,primary_capsule_ratio))) for convi in convis]
        
        
    def feed_foreward(images):
        batch_size = T.shape(images)[0]
        #hack, not doing this is possible but would be annoying
        conv_stacks = [T.stack([convs]*batch_size) for convs in self.convolutions]
        weight_stacks = [T.stack([weights]*batch_size) for weights in self.weights]
        return self.ff(images,*conv_stacks,*weight_stacks)
    
def main():
    conv_size = [10,10]
    conv_arch = [30]
    caps_arch = [30,20,10]
    images = [np.zeros((1000,1000))]
    c = capsnet(conv_size,conv_arch,caps_arch)
    c.feed_foreward(images)
    c.ff.profile.summary()
    

if __name__=='__main__':
    main()
