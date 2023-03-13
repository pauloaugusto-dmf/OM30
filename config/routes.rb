require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  scope '(:locale)', locale: /pt-BR|en/ do
    root 'citizens#index'

    resources :citizens, except: [:destroy]
  end
end
