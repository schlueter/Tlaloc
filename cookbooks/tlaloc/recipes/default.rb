include_recipe 'amazon_ses'

amazon_ses 'foo' do
    to %w{ bs@bschlueter.com }
    source 'bs@bschlueter.com'
    text_body 'bar'
end
