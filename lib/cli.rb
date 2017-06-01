# require_relative "api_communicator.rb"
require "pry"
class CLI

attr_accessor :viewer

def initialize
  @viewer = viewer
end

def welcome
  puts "NYC Schools and Upcoming Projects Database"
  puts ""
  puts "Please enter your name: "
  name = gets.chomp
  @viewer = Viewer.create(name: name)
end

def get_answer
  puts "Enter a zip-code or borough:"
  answer = gets.chomp
  if answer.match(/[0-9]/)
    new_search = Location.create(name: answer)
    answer_array = API.get_projects_by_zip(answer)
    answer_array.each do |project|
      new_project = Project.find_or_create_by(name: project["name"], address: project["building_address"], description: project["projdesc"], city: project["city"])
      new_search.update(viewer: Viewer.all.last, project: new_project)
    end
    answer
   else
    API.get_projects_by_boro(answer)
  end
end

def no_construction
  puts "No construction in this area."
  self.get_answer
end
end
