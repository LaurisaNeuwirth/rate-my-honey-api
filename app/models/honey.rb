#
class Honey < ActiveRecord::Base
  has_many :topics
  belongs_to :user

end
