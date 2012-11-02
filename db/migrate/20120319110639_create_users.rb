class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username 
    	t.string :email
    	t.string :encrypted_password 
    	t.string :salt
		t.string :name
		t.date :birthdate
		t.string :sex
		t.integer :credits
		t.string :location
      	t.timestamps
    end
  end
end
