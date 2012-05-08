class Crossover
    include Mongoid::Document
    
    field :url
    field :versions, :type => Array
    field :maxrating  
    
  embedded_in :article, :inverse_of => :crossover
  
end
