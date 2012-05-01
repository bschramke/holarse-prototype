class Wine < WindowsRunner
  
  embedded_in :article, :inverse_of => :wine  
  
end
