require_relative "../config/environment"

new_cli = CLI.new
new_cli.welcome
answer = new_cli.get_answer

API.get_projects(answer)
