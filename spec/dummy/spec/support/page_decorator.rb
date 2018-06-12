module PageDecorator

  extend ActiveSupport::Concern

  included do
    def name
      title
    end
  end

  class_methods do
    def hello
      'world'
    end
  end

end
