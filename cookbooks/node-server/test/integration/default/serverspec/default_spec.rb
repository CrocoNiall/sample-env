require 'serverspec'

set :backend, :exec

describe package('nginx') do 
  it { should be_installed }
end

describe service('nginx') do 
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do 
  it { should be_listening }
end

describe command('git --version') do 
  its(:stdout) { should contain("2.7.4") }
end

describe command('node -v') do 
  its(:stdout) { should match /6\.10\.0/ }
end

describe package('pm2') do
  it { should be_installed.by('npm') }
end

describe file('/etc/nginx/sites-available/default') do
  it { should be_file }
end

describe file('/etc/nginx/sites-enabled/default') do
  it { should be_symlink }
end
