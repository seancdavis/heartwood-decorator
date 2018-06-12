require 'rails/generators'

module Heartwood
  class DecoratorGenerator < Rails::Generators::Base

    desc "Create a new decorator file."

    source_root File.expand_path("./templates", __dir__)

    argument :model, desc: 'Name of model (e.g. User)', required: true, type: 'string'

    def validate_model
      begin
        @name = @model.classify.constantize
        @short_name = @model.underscore
      rescue NameError
        raise NameError.new("Could not find model from \"#{@model}\"")
      end
    end

    def render_template
      template 'decorator.erb', "app/decorators/#{@short_name}_decorator.rb"
    end

  end
end
