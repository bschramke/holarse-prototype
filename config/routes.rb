Holarse::Application.routes.draw do

  # api
  get "holarse/api/autolinkable" # erzeugt die internen links auf artikel
  get "holarse/api/discount_count" # zaehlt die rabattaktionen
  post "holarse/api/markup_preview" # ermoeglicht die vorschau von markdown-seiten
  get "holarse/api/minecrafters" # die whitegelisteten minecraft-user
  get "holarse/api/site_statistics" # die holarse-statistik
  get "holarse/api/taglist" # die tagliste je kategorie

  # holarse-services-seiten
  get "holarse/service/index", as: :holarse_service
  get "holarse/service/mumble", as: :holarse_service_mumble
  get "holarse/service/jabber", as: :holarse_service_jabber
  get "holarse/service/gameserver", as: :holarse_service_gameserver

  # die angebotsaktionen
  resources :discount_events do
    resources :comments
  end

  # die suche
  get "search/suggest" => "search#suggest"
  match "search/(:q)" => "search#show", as: :search, via: [:get, :post]
  get "search/tags/:q" => "search#tags", as: :searchtag

  # webseiten resourcen
  resources :users
  resources :news do
    resources :comments
    resources :links
    resources :screenshots
    resources :videos
    resources :attachments
    resources :history
  end

  resources :articles do
    resources :comments
    resources :links
    resources :screenshots
    resources :videos
    resources :attachments
    resources :shops
    resources :history
  end

  # login und sessionverwaltung
  get 'users/new', :as => :register
  resource :session, :only => [:new, :create, :destroy]
  get 'session/login' => 'sessions#new', :as => :login
  get 'session/logout' => 'sessions#destroy', :as => :logout

  # einzelseiten
  get "welcome/index"
    
  # shortcuts
  get "videos" => "media#videos"

  # redirects
  get "/redirect/twitter" => redirect("https://twitter.com/#!/holarse"), :as => :twitter

  get "/redirect/youtube/:channel" => redirect("https://www.youtube.com/user/%{channel}"), :as => :youtube_channel

  get '/redirect/osm/:city' => redirect("http://nominatim.openstreetmap.org/search.php?q=%{city}"), :as => :osm

  get '/version/:commitid' => redirect("https://bitbucket.org/holarse/holarse/changeset/%{commitid}"), :as => :version
  
  # root
  root :to => "welcome#index"
  
end
