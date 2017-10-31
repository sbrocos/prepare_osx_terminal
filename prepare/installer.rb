# Module for functions for install
module Installer
  @app_list = nil

  def run(all, app)
    @app_list = all

    parent(app)
    process(app)
    children(app)
    post_install(app)
  end

  def process(app)
    brew_install(app) if type(app) == 'brew'
    Functions.send(app[:app]) if type(app) == 'function'
  end

  def type(app)
    app[:type] || 'brew'
  end

  def brew_install(app)
    if exist_directory?(app)
      puts "#{app[:app]} yet installed"
      return
    end

    puts "Installing #{app[:app]}"
    system("brew install #{app[:app]} #{app[:option]}")
  end

  def exist_directory?(app, path = nil)
    return Dir.exist?("/usr/local/Cellar/#{app[:app]}") if path.nil?

    Dir.exist?(path)
  end

  def parent(app)
    process(search(app[:depend])) unless app[:depend].nil?
  end

  def children(app)
    process(search(app[:child])) unless app[:child].nil?
  end

  def search(app_name)
    @app_list.select { |x| x[:app] == app_name }.first
  end

  def post_install(app)
    return if app[:post].nil?

    Post.send(app[:post])
  end
end
