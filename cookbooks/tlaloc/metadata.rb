name             'tlaloc'
maintainer       'Schlueter'
maintainer_email 'bs@bschlueter.com'
license          'GPL v3'
description      'Facilitates uploading files and emailing a link to those files during a chef run'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports         'ubuntu'

depends          'amazon_ses'
