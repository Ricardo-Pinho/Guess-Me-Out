class CreateComponenttypes < ActiveRecord::Migration
  def change
    create_table :componenttypes do |t|
      t.string :color
      t.string :name
      t.integer :price
      t.text :svg
      t.references :component

      t.timestamps
    end
    add_index :componenttypes, :component_id
  end
end
