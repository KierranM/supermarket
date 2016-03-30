#
# Cookbook Name:: supermarket
# Recipe:: sidekiq
#
# Copyright 2014 Chef Software, Inc.
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

directory "#{node['supermarket']['log_directory']}/sidekiq" do
  owner node['supermarket']['user']
  group node['supermarket']['group']
  mode '0700'
end

if node['supermarket']['sidekiq']['enable']
  component_runit_service 'sidekiq' do
    package 'supermarket'
  end
else
  runit_service 'sidekiq' do
    action :disable
  end
end
