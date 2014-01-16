require 'minitest/spec'

class TimezoneIiSpec < MiniTest::Chef::Spec

    describe_recipe 'rackspace_time::default' do

        it 'updates the timezone' do
            IO.read('/etc/localtime').must_equal IO.read("/usr/share/zoneinfo/#{node[:rackspace_time][:tz]}")
        end

    end

end
