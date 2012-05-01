class Onlineshop
  include Mongoid::Document
  
  field :name
  field :url
  
  embedded_in :article
  
end
