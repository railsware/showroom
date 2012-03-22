class CreateShowrooms < ActiveRecord::Migration
  def change
    create_table :showrooms do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
