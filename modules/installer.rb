# Class Installer General
class Installer
  attr_accessor :name, :type, :command, :ocommand, :depend, :children

  def initialize(name, options = {})
    @name = name
    @type = options['type'] || 'brew'
    @command = options['command']
    @ocommand = options['ocommand']
    @depend = options['depend']
    @children = options['children']
  end

  def process
    install
  end

  private

  def exists_directory?
    Dir.exist?("/usr/local/Cellar/#{name}")
  end

  def install
    puts brew_install if type == 'brew'
  end

  def brew_install
    return "#{name} yet installed" if exists_directory?

    " >> brew install #{name} #{ocommand}"
  end
end
