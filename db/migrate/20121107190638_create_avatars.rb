class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.references :user
      t.timestamps
    end
    add_index :avatars, :user_id
  end
end
