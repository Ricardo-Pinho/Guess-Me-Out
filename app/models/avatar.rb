class Avatar < ActiveRecord::Base
	attr_accessible :name,:user,:user_id, :svg
  belongs_to :user
  has_many :avatarcomponents

  validates :name, :presence => true, :uniqueness => true


end
