# module for PoSt install methods
module Post
  def zsh
    if Dir.exist?('.oh-my-zsh')
    	puts 'curl -L https://github.com/robbyrussell/oh-my-zsh/' \
      	   'raw/master/tools/install.sh | sh'
    end
    puts 'chsh -s /usr/local/bin/zsh' if %x[echo $SHELL] != "/bin/zsh\n"
    puts 'other options'
  end
end
