Paperclip::Attachment.default_options.update({
  :path => ':rails_root/public/system/:class/:id/:style/:filename',
#  :hash_secret => ",mnd,asd92183ho2j5hl2k1jhlkjh",
#  :hash_data => ":class/:id/:style/:filename",
#  :url => ":class/:hash.:extension"
  :url => '/assets/:class/:id/:style/:filename'
})