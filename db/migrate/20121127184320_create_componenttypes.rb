class CreateComponenttypes < ActiveRecord::Migration
  def change
    create_table :componenttypes do |t|
      t.integer :color
      t.string :name
      t.integer :price
      t.blob :svg
      t.references :component
	  t.text :test1
	  t.blob :test2

      t.timestamps
    end
    add_index :componenttypes, :component_id
  end
end
