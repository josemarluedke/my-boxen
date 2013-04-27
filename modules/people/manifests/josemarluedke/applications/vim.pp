class people::josemarluedke::applications::vim {
  $home = "/Users/${::luser}"

  if !file_exists("$home/.vim/install.sh") {
    exec { "curl https://raw.github.com/${boxen::config::login}/vimfiles/master/install.sh -o - | sh":
      cwd => "/Users/${luser}"
    }

    exec { "rake install":
      cwd => "/Users/${luser}/.vim/"
    }
  }
}
