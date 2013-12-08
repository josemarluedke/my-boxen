# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.5.1"
github "hub",        "1.2.0"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.5.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.1.0"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.6"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "ctags",             "1.0.0"
github "heroku",            "2.1.1"
github "memcached",         "1.2.0"
github "redis",             "2.1.0"
github "postgresapp",       "1.0.0"
github "imagemagick",       "1.2.1"
github "iterm2",            "1.0.6"
github "tmux",              "1.0.2"
github "gitx",              "1.2.0"
github "wget",              "1.0.0"
github "sublime_text_2",    "1.1.2"
github "macvim",            "1.0.0"
github "mou",               "1.0.0"
github "github_for_mac",    "1.0.1"
github "caffeine",          "1.0.0"
github "googledrive",       "1.0.2"
github "virtualbox",        "1.0.3"
github "vagrant",           "2.0.7"
github "vlc",               "1.0.5"
github "textual",           "3.2.3"
github "alfred",            "1.1.7"
github "appcleaner",        "1.0.0"
github "pckeyboardhack",    "1.0.2", :repo => "josemarluedke/puppet-pckeyboardhack"
github "transmit",          "1.0.0"
github "skype",             "1.0.7"
github "chrome",            "1.1.2"
github "onepassword",       "1.1.0"
github "firefox",           "1.1.5"
github "rdio",              "1.0.0"
github "java",              "1.1.2"
