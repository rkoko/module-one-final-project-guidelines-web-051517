# require_relative "api_communicator.rb"
require "pry"
class CLI

attr_accessor :viewer

def initialize
  @viewer = viewer
end

def welcome
  puts "Welcome to NYC Complaints Search"
  puts ""
  puts "Please enter your name: "
  name = gets.chomp
  @viewer = Viewer.create(name: name)
end

def get_answer
  puts "Enter a zip-code or borough to see the schools and their upcoming projects:"
  answer = gets.chomp
  new_search = Location.create(name: answer)
  #binding.pry
  new_project = Project.find_or_create_by(name: API.get_projects(answer)[0], address: API.get_projects(answer)[1], description: API.get_projects(answer)[2], city: API.get_projects(answer)[3])
  new_search.update(viewer: self.viewer,project: new_project)
  answer
end



def no_construction
  puts "No construction in this area."
  self.get_answer
end

end
