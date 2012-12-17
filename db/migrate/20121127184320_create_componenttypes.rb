class CreateComponenttypes < ActiveRecord::Migration
  def change
    create_table :componenttypes do |t|
      t.integer :color
      t.string :name
      t.integer :price
      t.string :svg
      t.references :component

      t.timestamps
    end
    add_index :componenttypes, :component_id
  end
end
