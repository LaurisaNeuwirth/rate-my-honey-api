#
class Topic < ActiveRecord::Base
  has_many :comments
  belongs_to :honey

end
