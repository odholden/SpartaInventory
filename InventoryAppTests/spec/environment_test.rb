describe package('rails') do
  it { should be_installed } # the package should be installed
end

describe service('nginx') do
  it {should not_be_running} # the package should not be installed
  it {should not_be_enabled} # the package should not be running
end

describe port(3000) do
  it { should be_listening } # should be listening on this port
end

describe port(80) do
  it { should_not be_listening } # should not be listening on this port
end

# Test ENV Variables
describe.one do
  describe bash('printenv DATABASE_HOST') do
    its('stdout') do
      'dbtest.cqito2bn96lf.eu-west-2.rds.amazonaws.com'
    end
  end

  describe bash('printenv APP_DATABASE_PASSWORD') do
    its('stdout') do
      'djdaskfjadsk329291iskdms'
    end
  end

  describe bash('printenv DATABASE_USER') do
    its('stdout') do
      'djdaskfjadsk329291iskdms'
    end
  end

  describe bash('printenv PGUSER') do
    its('stdout') do
      'postgres'
    end
  end

  describe bash('printenv RAILS_ENV') do
    its('stdout') do
      'production'
    end
  end
end

# # Test the DB
# password = attribute('password', default: 'HARDCODEDpasswordHERE', description: 'password for admin user in mysql database')
# db = mysql_session('admin', password)
#
# describe db.query("SHOW DATABASES LIKE 'mydatabase'") do
#   context "'mydatabase' database exists" do
#     its('stdout') { should include 'mydatabase' }
#   end
# end
