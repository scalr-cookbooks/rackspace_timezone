#
# Cookbook Name:: rackspace_time
# Recipe:: default
#
# Copyright 2010, James Harton <james@sociable.co.nz>
# Copyright 2013, Lawrence Leonard Gilbert <larry@L2G.to>
# Copyright 2013, fraD00r4 <frad00r4@gmail.com>
# Copyright 2014, Rackspace, US, Inc.
#
# Apache 2.0 License.
#

# Make sure the tzdata database is installed. 
package 'tzdata' do
  action :install
end


case node[:platform]
when 'ubuntu', 'debian'
  template "/etc/timezone" do
    source "timezone.conf.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :run, 'bash[dpkg-reconfigure tzdata]'
  end

  bash 'dpkg-reconfigure tzdata' do
    user 'root'
    code "/usr/sbin/dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end
end
when 'centos', 'rhel'
  template "/etc/sysconfig/clock" do
    source "clock.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :run, 'bash[tzdata-update]'
  end

  bash 'tzdata-update' do
    user 'root'
    code "/usr/sbin/tzdata-update"
    action :nothing
  end
end