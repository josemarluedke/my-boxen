class people::josemarluedke {
  # Packages
  include people::josemarluedke::packages::the_silver_searcher

  # Aplications
  include people::josemarluedke::applications::dotfiles
  include people::josemarluedke::applications::vim
  include people::josemarluedke::applications::gems
}
