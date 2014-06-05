include_recipe 'amazon_ses'

aws_s3 'foo' do
    bucket 'Tlaloc'
    content 'bar'
end

aws_ses 'foo' do
    to %w{ bs@bschlueter.com }
    source 'bs@bschlueter.com'
    text_body 'bar'
end
