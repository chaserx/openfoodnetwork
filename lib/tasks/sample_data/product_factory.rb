require "tasks/sample_data/logging"

class ProductFactory
  include Logging

  def create_samples(enterprises)
    log "Creating products:"
    product_data(enterprises).map do |hash|
      create_product(hash)
    end
  end

  private

  def product_data(enterprises)
    vegetables = Spree::Taxon.find_by_name('Vegetables')
    fruit = Spree::Taxon.find_by_name('Fruit')
    meat = Spree::Taxon.find_by_name('Meat and Fish')
    producers = enterprises.select(&:is_primary_producer)
    distributors = enterprises.select(&:is_distributor)
    [
      {
        name: 'Garlic',
        price: 20.00,
        supplier: producers[0],
        taxons: [vegetables],
        distributor: distributors[0]
      },
      {
        name: 'Fuji Apple',
        price: 5.00,
        supplier: producers[1],
        taxons: [fruit],
        distributor: distributors[0]
      },
      {
        name: 'Beef - 5kg Trays',
        price: 50.00,
        supplier: producers[1],
        taxons: [meat],
        distributor: distributors[0]
      },
      {
        name: 'Carrots',
        price: 3.00,
        supplier: producers[2],
        taxons: [vegetables],
        distributor: distributors[0]
      },
      {
        name: 'Potatoes',
        price: 2.00,
        supplier: producers[2],
        taxons: [vegetables],
        distributor: distributors[0]
      },
      {
        name: 'Tomatoes',
        price: 2.00,
        supplier: producers[2],
        taxons: [vegetables],
        distributor: distributors[0]
      }
    ]
  end

  def create_product(hash)
    log "- #{hash[:name]}"
    params = hash.merge(
      supplier_id: hash[:supplier].id,
      primary_taxon_id: hash[:taxons].first.id,
      variant_unit: "weight",
      variant_unit_scale: 1,
      unit_value: 1,
      shipping_category: DefaultShippingCategory.find_or_create
    )
    product = Spree::Product.create_with(params).find_or_create_by_name!(params[:name])
    product.variants.first.update_attribute :on_demand, true
    product
  end
end
