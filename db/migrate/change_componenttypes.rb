class ChangeComponentTypes < ActiveRecord::Migration
  def change
    change_table :componenttypes do |t|
			t.change :color, :string
			t.change :svg, :string
    end
  end
end