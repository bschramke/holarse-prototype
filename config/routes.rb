Holarse::Application.routes.draw do

  get "newcontent/index", :as => :newcontent

  get "link_generator/index"

  post "markup_preview/preview", :as => :markuppreview

  get "counting/messages"

  get "counting/discounts"

  # die angebotsaktionen
  resources :discount_events

  # die suche
  match "search/(:q)" => "search#show", :as => :search
  get "search/tags/:q" => "search#tags", :as => :searchtag

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

  resource :twitter, :only => :show
  
  # login und sessionverwaltung
  resource :session, :only => [:new, :create, :destroy]
  match 'session/login' => 'sessions#new', :as => :login
  match 'session/logout' => 'sessions#destroy', :as => :logout

  # einzelseiten
  get "service/minecraft"
  get "welcome/index"
    
  # shortcuts
  match "videos" => "media#videos"

  # redirects
  match "/redirect/twitter" => redirect("https://twitter.com/#!/holarse"), :as => :holarse_twitter

  match "/redirect/youtube/:channel" => redirect("https://www.youtube.com/user/%{channel}"), :as => :youtube_channel

  match '/redirect/osm/:city' => redirect("http://nominatim.openstreetmap.org/search.php?q=%{city}"), :as => :osm

  get '/version/:commitid' => redirect("https://bitbucket.org/holarse/holarse/changeset/%{commitid}"), :as => :version
  
  # root
  root :to => "welcome#index"
  
end
