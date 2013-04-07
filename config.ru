require "bundler/setup"
Bundler.require

# so logging output appears properly
$stdout.sync = true

require "./web"

run Web
