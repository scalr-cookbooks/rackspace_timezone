# encoding: UTF-8
name             'rackspace_timezone'
maintainer       'Rackspace, US, Inc.'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Configure the system timezone on Linux systems'
version          '1.0.0'

recipe 'rackspace_timezone', 'Set time zone details on server'

replaces         'timezone'
