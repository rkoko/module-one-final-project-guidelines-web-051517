require 'pry'
class API
def self.get_projects(answer)
    all_projects = RestClient.get('https://data.cityofnewyork.us/resource/6mes-nc4i.json')
    projects_hash = JSON.parse(all_projects)
    select_zip = projects_hash.select {|project| project["zip_code"] == answer}
    select_boro = projects_hash.select {|project| project["city"] == answer}
      if select_zip.count >0
        select_zip.collect do |project|
          puts "********************"
          puts "School Name: #{project["name"]}"
          puts "School Address: #{project["building_address"]}"
          puts "City: #{project["city"]}"
          puts "Project Description: #{project ["projdesc"]}"
          puts "Zipcode: #{project ["zip_code"]}"
          puts "********************"
          [project["name"], project["building_address"], project["projdesc"], project["city"]]
          end
      elsif select_boro.count > 0
          select_boro.collect do |project|
            puts "********************"
            puts "School Name: #{project["name"]}"
            puts "School Address: #{project["building_address"]}"
            puts "City: #{project["city"]}"
            puts "Project Description: #{project ["projdesc"]}"
            puts "Zipcode: #{project ["zip_code"]}"
            puts "********************"
              [project["name"], project["building_address"], project["projdesc"], project["city"]]
            end
      else
        new_search =CLI.new
        new_search.no_construction
      end
    end
end
