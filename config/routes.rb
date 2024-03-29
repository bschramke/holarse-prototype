Holarse::Application.routes.draw do

  get "impressum" => "static_pages#imprint", as: :imprint
  get "intro" => "static_pages#intro", as: :introduction
  get "markdownhelp" => "static_pages#markdownhelp", as: :markdownhelp
  get "newcontent" => "static_pages#newcontent", as: :newcontent

  # api
  get "holarse/api/autolinkable" # erzeugt die internen links auf artikel
  get "holarse/api/discount_count" # zaehlt die rabattaktionen
  post "holarse/api/markup_preview" # ermoeglicht die vorschau von markdown-seiten
  get "holarse/api/minecrafters" # die whitegelisteten minecraft-user
  get "holarse/api/site_statistics" # die holarse-statistik
  get "holarse/api/taglist" # die tagliste je kategorie
  get "holarse/api/mumble" # der mumble-user count
  post "holarse/api/grab_title" # der seitentitel
  get "holarse/api/inbox_count"

  # holarse-services-seiten
  get "holarse/service/index", as: :holarse_service
  get "holarse/service/mumble", as: :holarse_service_mumble
  get "holarse/service/jabber", as: :holarse_service_jabber
  get "holarse/service/gameserver", as: :holarse_service_gameserver
  get "holarse/service/communities", as: :holarse_service_communities

  # die angebotsaktionen
  resources :discount_events do
    resources :comments
  end

  resources :inboxes

  # die suche
  get "search/suggest" => "search#suggest"
  match "search/(:q)" => "search#show", as: :search, via: [:get, :post]
  get "search/tags/:q" => "search#tags", as: :searchtag

  # die entwuerfe
  resources :drafts

  # webseiten resourcen
  resources :users
  resources :news do
    resources :comments
    resources :videos
    resources :history
    resources :news_updates
  end

  resources :articles do
    resources :comments
    resources :videos
    resources :history
  end

  # abwaertskompatibilitaet
  get "wiki/:name", to: redirect("/articles/%{name}")

  # login und sessionverwaltung
  get 'users/new', as: :register
  resource :session, only: [:new, :create, :destroy]
  get 'session/login' => 'sessions#new', as: :login
  get 'session/logout' => 'sessions#destroy', as: :logout

  # einzelseiten
  get "welcome/index"
    
  # shortcuts
  get "videos" => "media#videos"

  # redirects
  get "/redirect/twitter" => redirect("https://twitter.com/#!/holarse"), as: :twitter

  get "/redirect/youtube/:channel" => redirect("https://www.youtube.com/user/%{channel}"), as: :youtube_channel

  get '/redirect/osm/:city' => redirect("http://nominatim.openstreetmap.org/search.php?q=%{city}"), as: :osm

  get '/version/:commitid' => redirect("https://github.com/commel/holarse/commit/%{commitid}"), as: :version
  get '/github'	=> redirect("https://github.com/commel/holarse"), as: :github 
  get '/yt/holarse' => redirect("https://www.youtube.com/user/holarse"), as: :youtube

  # root
  root :to => "welcome#index"
  
end
