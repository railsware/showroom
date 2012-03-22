class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string    :name
      t.text      :description
      t.string    :image
      t.decimal   :price, :precision => 10, :scale => 8
      t.timestamps
    end
  end
end
