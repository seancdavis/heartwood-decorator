require 'generators/heartwood/decorator_generator'

RSpec.describe Heartwood::DecoratorGenerator do

  let(:decorator_file) { File.expand_path('../../../app/decorators/page_decorator.rb', __dir__) }
  let(:model_file) { File.expand_path('../../../app/models/page.rb', __dir__) }

  before(:each) { system("bin/rails d heartwood:decorator page") }

  it 'creates a decorator file with placeholder' do
    expect(File.exist?(decorator_file)).to eq(false)
    system("bin/rails generate heartwood:decorator page --force")
    exp_decorator = File.read(File.expand_path('../../support/page_decorator.blank.rb', __dir__))
    expect(File.read(decorator_file)).to eq(exp_decorator)
  end

  it 'references the decorator in the page model' do
    expect(File.read(model_file)).to_not include('include PageDecorator')
    system("bin/rails generate heartwood:decorator page --force")
    expect(File.read(model_file)).to include('include PageDecorator')
  end

  it 'does not create a file when the model does not exist' do
    user_model_file = File.expand_path('../../../app/models/user.rb', __dir__)
    expect(File.exist?(user_model_file)).to eq(false)
    system("bin/rails generate heartwood:decorator user --force")
    expect(File.exist?(user_model_file)).to eq(false)
  end

end
