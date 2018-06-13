require 'rails_helper'

RSpec.describe 'PageDecorator' do

  let(:page) { Page.new(title: 'Hello World') }

  before(:all) do
    system("bin/rails generate heartwood:decorator page --force")
    decorator_file = File.expand_path('../../app/decorators/page_decorator.rb', __dir__)
    FileUtils.rm(decorator_file) if File.exist?(decorator_file)
    tmp_decorator_file = File.expand_path('../support/page_decorator.rb', __dir__)
    FileUtils.cp(tmp_decorator_file, decorator_file)
  end

  after(:all) { system("bin/rails d heartwood:decorator page")  }

  it 'can add instance methods to an object' do
    expect(page.name).to eq('Hello World')
  end

  it 'can add instance methods to an object' do
    expect(Page.hello).to eq('world')
  end

end
