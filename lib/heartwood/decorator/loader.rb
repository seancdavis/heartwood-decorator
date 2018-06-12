module Heartwood
  module Decorator
    class Loader < Rails::Railtie

      initializer 'heartwood-decorator.loader' do
        Dir.glob(Rails.root.join('app', 'decorators', '*.rb')).each { |f| require(f) }
      end

    end
  end
end
