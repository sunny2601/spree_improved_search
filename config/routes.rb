Spree::Core::Engine.routes.draw do
  get '/search/', to: 'spree_improved_search#product_search' , as: 'spree_improved_search'
end
