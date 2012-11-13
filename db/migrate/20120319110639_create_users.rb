class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username 
    	t.string :email
    	t.string :encrypted_password 
		t.string :name
		t.date :birthdate
		t.date :last_login
		t.string :sex
		t.integer :credits
		t.string :location
<<<<<<< HEAD
		t.integer :admin
    t.timestamps
=======
		t.boolean : admin
      	t.timestamps
>>>>>>> 5a21aceefabd678c5eeaeeff2ce5ee0f5ab9d6c0
    end
  end
end
