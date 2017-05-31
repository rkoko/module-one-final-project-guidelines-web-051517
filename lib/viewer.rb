class Viewer < ActiveRecord::Base
  has_many :locations
  has_many :projects, through: :locations
  validates :name, uniqueness: true

  def history
      self.projects
  end

end
