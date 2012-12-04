class CreateAvatarcomponents < ActiveRecord::Migration
  def change
    create_table :avatarcomponents do |t|
      t.references :avatar
      t.references :componenttype
      t.references :component

      t.timestamps
    end
    add_index :avatarcomponents, :avatar_id
    add_index :avatarcomponents, :componenttype_id
    add_index :avatarcomponents, :component_id
  end
end
