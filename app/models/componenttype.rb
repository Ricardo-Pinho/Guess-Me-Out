class Componenttype < ActiveRecord::Base
attr_accessible :color,:name,:price,:svg,:component
  belongs_to :component
  has_many :avatarcomponents
end
