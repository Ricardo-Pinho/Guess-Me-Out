class Componenttype < ActiveRecord::Base
attr_accessible :color,:name,:price,:svg,:component,:component_id, :test1, :test2
  belongs_to :component
  has_many :avatarcomponents
end
