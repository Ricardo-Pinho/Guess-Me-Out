class CreateAvatarcomponents < ActiveRecord::Migration
  def change
    create_table :avatarcomponents do |t|
      t.references :avatar
      t.references :componenttype

      t.timestamps
    end
    add_index :avatarcomponents, :avatar_id
    add_index :avatarcomponents, :componenttype_id
  end
end
