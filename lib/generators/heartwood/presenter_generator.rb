require 'rails/generators'

module Heartwood
  class PresenterGenerator < Rails::Generators::Base

    desc "Create a new presenter file."

    source_root File.expand_path("./templates", __dir__)

    argument :model, desc: 'Name of model (e.g. User)', required: true, type: 'string'

    def validate_model
      begin
        @model = @model.classify.constantize
      rescue NameError
        raise NameError.new("Could not find model from \"#{@model}\"")
      end
    end

    def render_template
      template 'presenter.erb', "app/presenters/#{@model.to_s.underscore}_presenter.rb"
    end

  end
end
