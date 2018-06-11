require 'rails/generators'

module Heartwood
  class PresenterGenerator < Rails::Generators::Base

    desc "Create a new presenter file."

    source_root File.expand_path("./templates", __dir__)

    argument :model, desc: 'Name of model (e.g. User)', required: true, type: 'string'

    def say_hello
      puts 'Hi'
    end

  end
end
