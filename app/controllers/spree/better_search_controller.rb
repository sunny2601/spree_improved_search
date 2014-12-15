module Spree
  class BetterSearchController < Spree::BaseController

  	def product_search
  		@taxonomies = Spree::Taxonomy.all
	    @searcher = Spree::Config.searcher_class.new( params )
	    @products = @searcher.get_by_sku_or_description
	    if @products && @products.count == 1
	      redirect_to product_path( @products[0] )
	    elsif @products && @products.count > 1
	      respond_with( @products ) do |format|
	      	# have to override this manually
	      	format.html { render 'spree/search/search_results' }
	      end
	    else
	      @products = @searcher.retrieve_products  
	      respond_with( @products ) do |format|
	      	# have to override this manually
	      	format.html { render 'spree/search/search_results' }
	      end
	    end
  	end

  end
end

