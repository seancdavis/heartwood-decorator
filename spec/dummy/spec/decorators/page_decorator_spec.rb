require 'rails_helper'

RSpec.describe 'PageDecorator' do

  let(:page) { Page.new(title: 'Hello World') }

  it 'can add instance methods to an object' do
    expect(page.name).to eq('Hello World')
  end

  it 'can add instance methods to an object' do
    expect(Page.hello).to eq('world')
  end

end
