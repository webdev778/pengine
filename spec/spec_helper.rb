# frozen_string_literal: true

require "pengine"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    # While some people may think of the :should syntax as
    # controversial, it looks much more clean and certain libraries,
    # like Sequel or Roda prefer this syntax in their tests.
    # Should syntax is not recommended for libraries that use a proxy
    # pattern which we don't plan to use.
    c.syntax = :should
  end
end
