Deface::Override.new(
  :virtual_path => "spree/shared/_search",
  :name => "spree_improved_search_path_mod",
  :replace => "erb[loud]:contains('form_tag')",
  :text => "<%= form_tag spree.spree_improved_search_path, :method => :get, class: 'navbar-form' do %>",
  :original => "<%= form_tag %>")