require 'generators/heartwood/decorator_generator'

RSpec.describe Heartwood::DecoratorGenerator do

  let(:decorator_file) { File.expand_path('../../../app/decorators/post_decorator.rb', __dir__) }
  let(:model_file) { File.expand_path('../../../app/models/post.rb', __dir__) }

  before(:each) { system("bin/rails d heartwood:decorator post") }

  it 'creates a decorator file with placeholder' do
    expect(File.exist?(decorator_file)).to eq(false)
    system("bin/rails generate heartwood:decorator post --force")
    exp_decorator = File.read(File.expand_path('../../support/post_decorator.blank.rb', __dir__))
    expect(File.read(decorator_file)).to eq(exp_decorator)
  end

  it 'references the decorator in the post model' do
    expect(File.read(model_file)).to_not include('include PostDecorator')
    system("bin/rails generate heartwood:decorator post --force")
    expect(File.read(model_file)).to include('include PostDecorator')
  end

  it 'does not create a file when the model does not exist' do
    user_model_file = File.expand_path('../../../app/models/user.rb', __dir__)
    expect(File.exist?(user_model_file)).to eq(false)
    system("bin/rails generate heartwood:decorator user --force")
    expect(File.exist?(user_model_file)).to eq(false)
  end

end
