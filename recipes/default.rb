#
# Cookbook Name:: route53
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

packages = case node.platform_family
when 'fedora','rhel','centos'
             %w{libxml2-devel libxslt-devel}
when 'debian','ubuntu'
             %w{libxml2-dev libxslt-dev}
end

packages.each do |pkg|
  r = package pkg
  r.run_action(:install)
end

fog = chef_gem "fog" do
  action :nothing
end
fog.run_action( :install )

require 'rubygems'
Gem.clear_paths
