# module function for install elixir
module Functions
  def elixir
    return if system('which elixir > /dev/null')

    puts 'Installing elixir'
    system(
      '\curl -sSL ' \
      'https://raw.githubusercontent.com/taylor/kiex/master/install ' \
      '| bash -s'
    )
    system('kiev install 1.5.2')
    system('kiev use 1.5.2 ')
    system('kiev default 1.5.2 ')
  end
end
