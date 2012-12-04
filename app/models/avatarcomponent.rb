class Avatarcomponent < ActiveRecord::Base
	attr_accessible :avatar,:componenttype ,:component
  belongs_to :avatar
  belongs_to :componenttype
  belongs_to :component
end
