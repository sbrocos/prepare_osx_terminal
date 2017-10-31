# module function for install 'brew serivces'
module Functions
  def brew_services
    return if system('brew services list > /dev/null')

    puts 'Installing brew services'
    system('brew install services')
  end
end
