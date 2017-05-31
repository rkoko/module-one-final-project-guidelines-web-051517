class Project< ActiveRecord::Base

  has_many :locations
  has_many :viewers, through: :locations



end
