class AddCurrentToShowcase < ActiveRecord::Migration
  def change
    add_column :showrooms, :current, :boolean, :default => true
  end
end
