Spree::Core::Engine.routes.draw do
  get '/search/', to: 'better_search#product_search' , as: 'better_product_search'
end
