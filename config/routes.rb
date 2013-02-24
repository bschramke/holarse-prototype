Holarse::Application.routes.draw do

  get "counting/messages"

  get "counting/discounts"

  # die angebotsaktionen
  resources :discount_events

  # die suche
  get "search/(:q)" => "search#show", :as => :search
  get "search/tags/:q" => "search#tags", :as => :searchtag

  # webseiten resourcen
  resources :users
  resources :news do
    resources :comments
    resources :links
    resources :screenshots
    resources :videos
    resources :attachments
  end
  resources :articles do
    resources :comments
    resources :links
    resources :screenshots
    resources :videos
    resources :attachments
    resources :shops
  end

  resource :twitter, :only => :show
  
  # login und sessionverwaltung
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
  resource :session

  # einzelseiten
  get "service/minecraft"
  get "welcome/index"
    
  # shortcuts
  match "videos" => "media#videos"

  # redirects
  match "/redirect/twitter" => redirect("https://twitter.com/#!/holarse"), :as => :holarse_twitter

  match "/redirect/youtube_channel" => redirect("https://www.youtube.com/user/holarse"), :as => :youtube_channel
  match "/redirect/gtux_channel" => redirect("https://www.youtube.com/user/gtux"), :as => :gtux_channel

  match '/redirect/osm/:city' => redirect("http://nominatim.openstreetmap.org/search.php?q=%{city}"), :as => :osm

  get '/version/:commitid' => redirect("https://bitbucket.org/holarse/holarse/changeset/%{commitid}"), :as => :version
  
  # root
  root :to => "welcome#index"
  
end
