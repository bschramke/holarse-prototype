class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description
  field :url

  embedded_in :article, :inverse_of => :videos
  embedded_in :news, :inverse_of => :videos
  embedded_in :newsupdate

  validates_format_of :url, :with => /\Ahttp:\/\/(w{3}.)?youtube\.com\/watch\?v=[\w]{11}\z/
end
