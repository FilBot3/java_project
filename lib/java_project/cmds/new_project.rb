require 'thor'
require 'thor/group'

module JavaProject
  # Generate a new Java Project
  class NewProject < Thor::Group
    include Thor::Actions

    desc 'Generate a new Java Project Skeleton.'

    argument :project_name,
             type: :string,
             desc: 'Name of the new Java Project.'

    def self.source_root
      File.join(File.dirname(__FILE__), '..', 'templates')
    end

    def create_project_base
      empty_directory(project_name)
      empty_directory(project_name + '/src')
      empty_directory(project_name + '/src/main')
      empty_directory(project_name + '/src/main/java')
      empty_directory(project_name + '/src/test')
      empty_directory(project_name + '/src/test/java')
    end

    def create_project_base_files
      template('build.xml.tt', project_name + '/build.xml')
      template('README.md.tt', project_name + '/README.md')
      template('Rakefile.rb.tt', project_name + '/Rakefile.rb')
      template('gitignore.tt', project_name + '/.gitignore')
    end

    def create_project_java_files
      template('default_main.java.tt', project_name + '/src/main/java/' + project_name.capitalize + '.java')
      template('default_test.java.tt', project_name + '/src/test/java/' + project_name.capitalize + '.java')
    end
  end
end
