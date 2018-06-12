require 'pry'

module Heartwood
  module Decorator
    class Loader < Rails::Railtie

      initializer 'heartwood-decorator.loader' do
        Dir.glob(Rails.root.join('app', 'decorators', '*_decorator.rb')).each do |f|

          decorator_class = File.basename(f, '.rb').classify.constantize
          model_class = File.basename(f, '_decorator.rb').classify.constantize

          model_class.class_eval { include(decorator_class) }
        end
      end

    end
  end
end
