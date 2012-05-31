Holarse::Application.routes.draw do

  # die suche
  get "search" => "search#show"

  # webseiten resourcen
  resources :users
  resources :news
  
  # login und sessionverwaltung
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
  resource :session

  # einzelseiten
  get "service/minecraft"
  get "welcome/index"
    
  # shortcuts
  match "youtube" => "media#youtube"

  # redirects
  match "/redirect/twitter" => redirect("https://twitter.com/#!/holarse"), :as => :twitter
  match "/redirect/youtube_channel" => redirect("https://www.youtube.com/user/holarse"), :as => :youtube_channel
  match '/redirect/osm/:city' => redirect("http://nominatim.openstreetmap.org/search.php?q=%{city}"), :as => :osm
  
  # root
  root :to => "welcome#index"
  
end
