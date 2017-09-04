require 'serverspec'

#Required by serverspec

set :backend, :exec

describe command('git --version') do
  its(:stdout) { should match /2\.7\.4/ }
end

# must not be sudo as rbenv install ruby for the user
describe command("ruby --version") do
  its(:stdout) { should match /2\.4./}
end




