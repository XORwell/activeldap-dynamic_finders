require 'active_ldap'
require 'active_ldap/dynamic_finders'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir.glob(File.expand_path("spec/support/**/*.rb")).each{ |f| require f }

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate

  # Include macros
  config.include LdapMacros
end

