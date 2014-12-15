module Spree
  module Core
    module Search
      Base.class_eval do

        def get_by_sku_or_description
          # make sure to always return an array!
          if keywords.start_with?("0")
            keywords[0] = ''
          end

          variants = Spree::Variant.where('sku LIKE ?', "%#{ keywords }%")

          if variants.any?
            ids = variants.map(&:product_id).uniq
            variant_product_id = ids.count == 1 ? ids[0] : nil
          else
            variant_product_id = nil
          end

          if variant_product_id
            @products = Spree::Product.where('id = ?', variant_product_id )
          else
            products = Spree::Product.where('name LIKE ?', "%#{ keywords }%")
            if products.any?
              ids = products.map(&:id).uniq
              ids.count == 1 ? @products = Spree::Product.where( "id = ?", ids[0] ) : @products = Product.where( 'id IN (?)', ids )
            else
              @products = nil
            end
          end
        end

      end
    end
  end
end