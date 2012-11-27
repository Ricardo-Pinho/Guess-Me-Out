class Avatar < ActiveRecord::Base
	attr_accessible :name,:user 
  belongs_to :user
  has_many :avatarcomponents
end
