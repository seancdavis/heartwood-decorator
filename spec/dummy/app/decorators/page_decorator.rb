class PageDecorator < Heartwood::Decorator::Base

  raise '123'

  decorates :page do
    #
    # Methods here will be attached directly to the Page object.
    # This means #self can be assumed to the the object. For example:
    #
    # def name
    #   title
    # end
    #
    # page = Page.new(title: 'Hello World')
    # page.name # => "Hello World"
    #
  end

end
