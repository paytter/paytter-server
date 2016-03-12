# NOTE: 実行コマンド
# $ itamae ssh -h dev-mikan recipe.rb --node-json node.json --shell /bin/bash
# $ itamae local --shell /bin/bash

execute 'yum update' do
  user "root"
  command "yum update -y"
end

execute 'yum upgrade' do
  user "root"
  command "yum upgrade -y"
end

%w(gcc git gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel nginx).each do |pkg|
  package pkg do
    action :install
  end
end

service 'nginx' do
  action [:enable, :start]
end

execute 'install node.js' do
  user 'root'
  command 'yum install nodejs npm --enablerepo=epel -y'
end

HOME_DIR = '/home/deploy'
RBENV_DIR = "#{HOME_DIR}/.rbenv"
RUBY_BUILD_DIR = "#{RBENV_DIR}/plugins/ruby-build"
RBENV_RUBY_VERSION = '2.3.0'

git RBENV_DIR do
  user 'deploy'
  repository 'git://github.com/sstephenson/rbenv.git'
end

file "create_bash_profile" do
  user 'deploy'
  path "#{HOME_DIR}/.bash_profile"
  owner 'deploy'
  group 'deploy'
  not_if "test -e #{HOME_DIR}/.bash_profile"
end

execute 'shell setup' do
  user 'deploy'
  command <<-EOF
    echo 'alias ls="ls --color"' >> #{HOME_DIR}/.bash_profile
  EOF
end

execute 'echo path for rbenv to bash_profile' do
  user 'deploy'
  command <<-EOF
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{HOME_DIR}/.bash_profile
    echo 'eval "$(rbenv init -)"' >> #{HOME_DIR}/.bash_profile
    source #{HOME_DIR}/.bash_profile
    type rbenv
  EOF
end

git RUBY_BUILD_DIR do
  user 'deploy'
  repository 'git://github.com/rbenv/ruby-build.git'
end

execute "install ruby #{RBENV_RUBY_VERSION}" do
  user 'deploy'
  not_if <<-EOF
    source #{HOME_DIR}/.bash_profile
    rbenv versions | grep #{RBENV_RUBY_VERSION}
  EOF

  command <<-EOF
    source #{HOME_DIR}/.bash_profile
    rbenv install #{RBENV_RUBY_VERSION}
  EOF
end

execute "set ruby #{RBENV_RUBY_VERSION} as global" do
  user 'deploy'
  command <<-EOF
    source #{HOME_DIR}/.bash_profile
    rbenv global #{RBENV_RUBY_VERSION}
    rbenv rehash
    gem install bundler
  EOF
end
