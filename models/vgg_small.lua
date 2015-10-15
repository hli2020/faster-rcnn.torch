require 'model_utilities'

function vgg_small(cfg)
  -- layer here means a block of one or more convolution layers followed by a max-pooling layer
  local layers = { 
    { filters= 64, kW=5, kH=5, padW=2, padH=2, dropout=0.0, conv_steps=1 },
    { filters=128, kW=3, kH=3, padW=1, padH=1, dropout=0.4, conv_steps=2 },
    { filters=256, kW=3, kH=3, padW=1, padH=1, dropout=0.4, conv_steps=2 },
    { filters=256, kW=3, kH=3, padW=1, padH=1, dropout=0.4, conv_steps=2 }
  }
  
  local anchor_nets = {
    { kW=3, n=256, input=3 },   -- input refers to the 'layer' defined above
    { kW=3, n=256, input=4 },
    { kW=5, n=256, input=4 },
    { kW=7, n=256, input=4 }
  }
  
  return create_model(cfg, layers, anchor_nets)
end

return vgg_small