require 'rails/generators'

module Heartwood
  class DecoratorGenerator < Rails::Generators::Base

    desc "Create a new decorator file."

    source_root File.expand_path("./templates", __dir__)

    argument :model_name, desc: 'Name of model (e.g. User)', required: true, type: 'string'

    def validate_model
      begin
        @model_name.classify.constantize
      rescue NameError
        raise NameError.new("Could not find model from \"#{@model_name}\"")
      end
    end

    def render_template
      template 'decorator.erb', "app/decorators/#{@model_name.underscore}_decorator.rb"
    end

    def include_decorator
      insert_into_file "app/models/#{@model_name.underscore}.rb",
                       "  include #{@model_name.classify}Decorator\n",
                       after: "ApplicationRecord\n"
    end

  end
end
