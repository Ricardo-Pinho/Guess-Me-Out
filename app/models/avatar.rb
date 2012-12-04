class Avatar < ActiveRecord::Base
	attr_accessible :name,:user,:user_id
  belongs_to :user
  has_many :avatarcomponents
end
