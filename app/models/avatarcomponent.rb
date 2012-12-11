class Avatarcomponent < ActiveRecord::Base
	attr_accessible :avatar_id,:componenttype_id ,:component_id, :avatar,:componenttype ,:component
  belongs_to :avatar
  belongs_to :componenttype
  belongs_to :component
end
