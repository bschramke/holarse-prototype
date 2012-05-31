class Karma
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :user
  field :point, :type => Integer
  
  validates_presence_of :user
  validates_presence_of :point
  validates :point, :numericality => { :only_integer => true, :less_than_or_equal_to => 1, :greater_than_or_equal_to => -1 }
  
  embedded_in :comment
  
  index(
    [
      [ :user, Mongo::ASCENDING ],
    ],
    :unique => true)  
  
end
