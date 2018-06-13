require 'rails_helper'

RSpec.describe 'PostDecorator' do

  let(:post) { Post.new(title: 'Hello World') }

  it 'does not have a name method' do
    expect { post.name }.to raise_error(NoMethodError)
  end

  it 'does not have a hello method' do
    expect { Post.hello }.to raise_error(NoMethodError)
  end

end
