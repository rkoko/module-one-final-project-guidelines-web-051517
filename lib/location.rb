class Location< ActiveRecord::Base
  belongs_to :viewer
  belongs_to :project

  def self.count_search
    self.group(:name).count.each do |k, v|
      puts "#{k}: #{v}"
    end
  end





end
