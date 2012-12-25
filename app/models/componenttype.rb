class Componenttype < ActiveRecord::Base
attr_accessible :color,:name,:price,:svg,:component,:component_id
  belongs_to :component
  has_many :avatarcomponents
end
