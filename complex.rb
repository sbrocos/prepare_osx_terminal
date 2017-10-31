require 'yaml'
require 'pry'
require './modules/installer.rb'

@app_yml = YAML.load_file(
  File.join(File.dirname(File.expand_path(__FILE__)), 'apps.yml')
)

@app_yml.map do |app, options|
  app_obj = Installer.new(app, options || {})

  if app_obj.depend.class == String
  	Installer.new(app_obj.depend, @app_yml[app_obj.depend] || {}).process
  end

  app_obj.process

  if app_obj.children.class == String
  	Installer.new(app_obj.children, @app_yml[app_obj.children] || {}).process
  end
end

puts 'FIN'
