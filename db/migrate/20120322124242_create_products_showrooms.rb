class CreateProductsShowrooms < ActiveRecord::Migration
  def change
    create_table :products_showrooms do |t|
      t.belongs_to    :product
      t.belongs_to    :showroom
      t.timestamps
    end
  end
end
