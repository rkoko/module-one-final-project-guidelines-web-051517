class Location< ActiveRecord::Base
  belongs_to :viewer
  belongs_to :project

  def self.popular_zips
    
  end
end
