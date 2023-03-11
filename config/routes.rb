Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    resources :citizens, except: [:destroy]
  end
end
