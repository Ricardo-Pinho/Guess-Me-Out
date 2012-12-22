class Usercomponent < ActiveRecord::Base
  attr_accessible :user_id,:componenttype_id ,:component_id, :user,:componenttype ,:component
  belongs_to :user
  belongs_to :component
  belongs_to :componenttype
end
