module PageDecorator # < Heartwood::Decorator::Base

  extend ActiveSupport::Concern

  included do
    def name
      title
    end
  end

  class_methods do
    def hi
      'hello'
    end
  end
  # decorates :page do
  #   def name
  #     title
  #   end
  # end

end
