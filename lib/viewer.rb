class Viewer < ActiveRecord::Base
  has_many :locations
  has_many :projects, through: :locations
  validates :name, uniqueness: true

  def self.history

  history_array=self.all.find_by_name(self.all.last.name).locations
  history_array.each do |location|
    puts location.name
  end 
  end

end
