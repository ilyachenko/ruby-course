class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 32
      t.integer :price
      t.string :desc
      t.string :img, limit: 32
    end
  end
end
