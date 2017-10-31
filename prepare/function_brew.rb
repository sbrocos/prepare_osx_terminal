# module funtion for install 'brew'
module Functions
  def brew
    return if system('which brew > /dev/null')

    puts 'Installing homebrew...'
    system(
      'ruby -e "$(curl -fsSL ' \
      'https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    )
  end
end
