class Avatarcomponent < ActiveRecord::Base
	attr_accessible :avatar,:componenttype
  belongs_to :avatar
  belongs_to :componenttype
end
