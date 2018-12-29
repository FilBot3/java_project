require 'java_project'
require 'java_project/cmds/new_project'
require 'thor'

module JavaProject
  # JavaProject::Generate
  # The Generate commands available.
  class Generate < Thor
    # Registering the project command
    # => https://github.com/erikhuda/thor/wiki/Groups
    register(JavaProject::NewProject, 'project', 'project NAME', 'Generate a new Java Project named NAME')
  end

  # JavaProject::CLI
  # The main class that drives the CLI.
  class CLI < Thor
    # JavaProject::CLI#generate
    # A subommand that generates new files for Java Projects.
    desc 'generate SUBCOMMAND', 'Generation tasks.'
    subcommand 'generate', Generate
  end
end
