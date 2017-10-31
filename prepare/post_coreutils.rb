# module Post for post_install of 'coreutils'
module Post
  def coreutils
    return if Dir.exist?('/usr/local/bin/sha256sum')

    puts 'sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum'
  end
end
