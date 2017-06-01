require 'pry'
class API
def self.get_projects_by_zip(answer)
    all_projects = RestClient.get('https://data.cityofnewyork.us/resource/6mes-nc4i.json')
    projects_hash = JSON.parse(all_projects)
    select_zip = projects_hash.select {|project| project["zip_code"] == answer}
      if select_zip.count >0
        select_zip.each do |project|
          puts "********************"
          puts "School Name: #{project["name"]}"
          puts "School Address: #{project["building_address"]}"
          puts "City: #{project["city"]}"
          puts "Project Description: #{project ["projdesc"]}"
          puts "Zipcode: #{project ["zip_code"]}"
          puts "********************"
        end
        else
          new_search = CLI.new
          new_search.no_construction
    end
end

def self.get_projects_by_boro(answer)
  all_projects = RestClient.get('https://data.cityofnewyork.us/resource/6mes-nc4i.json')
  projects_hash = JSON.parse(all_projects)
  select_boro = projects_hash.select {|project| project["city"].downcase == answer.downcase}
  if select_boro.count > 0
  puts "There are #{select_boro.count} result(s). Please enter a specific zip code for more info."
     zip_search =CLI.new
     zip_search.get_answer
   else
     new_search =CLI.new
     new_search.no_construction
   end
end
end
