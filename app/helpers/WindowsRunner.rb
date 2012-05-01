  class WindowsRunner 
    include Mongoid::Document
    
    field :url
    field :versions, :type => Array
    field :maxrating

  end