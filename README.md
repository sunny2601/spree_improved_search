SpreeBetterSpreeSearch
======================

This is a refined search engine for Spree. It searches by product SKU first, then by product description, and sends you directly to a product if there is only one search result.

Installation
------------

Add spree_better_spree_search to your Gemfile:

```ruby
gem 'spree_better_spree_search'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_better_spree_search:install
```
