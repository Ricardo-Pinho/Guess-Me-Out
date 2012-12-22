class CreateUsercomponents < ActiveRecord::Migration
  def change
    create_table :usercomponents do |t|
      t.references :user
      t.references :component
      t.references :componenttype

      t.timestamps
    end
    add_index :usercomponents, :user_id
    add_index :usercomponents, :component_id
    add_index :usercomponents, :componenttype_id
  end
end
