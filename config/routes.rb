Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    root 'citizens#index'

    resources :citizens, except: [:destroy]
  end
end
