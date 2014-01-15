name             'rackspace_time'
maintainer       'Rackspace, US, Inc.'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Configure the system timezone on Linux systems'
version          "1.0.0"

recipe 'rackspace-time', 'Set time zone details on server'

replaces         "timezone"

