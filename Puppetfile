forge 'https://forge.puppet.com'

# Modules from the Puppet Forge
# Versions should be updated to be the latest at the time you start
#mod 'puppetlabs/inifile',     '2.2.1'
#mod 'puppetlabs/stdlib',      '4.25.1'
# modules for workstation and development laptop setup
mod 'abuxton/pdk' #latest
mod 'puppet-staging', '3.2.0' #dep. abuxton/pdk
mod 'puppetlabs-stdlib'#, '4.13.1' #install latest
mod 'puppetlabs/resource_api' #
mod 'puppetlabs-puppetserver_gem', '1.0.0' #dep. puppetlabs/resource_api

# provisioning tools
mod 'puppetlabs-aws', '2.1.0'

# environment tools
mod 'ccin2p3-bolt', '0.2.0' #no osx support so usefull for master Setup
mod 'puppetlabs-bootstrap', '0.2.0' #install PE agents with Bolt
mod 'puppetlabs-puppet_agent', '1.6.0' #manage and upgrade agents
mod 'WhatsARanjit-node_manager', '0.7.1' #manage classification groups

# Modules from Git
# Examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
#mod 'apache',
#  :git    => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :commit => 'de290646f97e04b4b8e42c70f6e01e860c394ce7'

#mod 'test',
#   :git    => '/etc/puppetlabs/code-test/modules/test',
#   :branch => 'master'
mod 'puppet_ds',
  :git => 'https://github.com/abuxton/puppet_ds',
  :branch => 'development'

mod 'puppet_mountpoint',
  :git => 'https://github.com/abuxton/puppet_mountpoint.git'
mod 'puppetlabs-inifile', '2.4.0'
mod 'puppetlabs-hocon', '1.0.1'
mod 'adviser',
  :git => 'git@github.com:puppetlabs/prosvc-adviser.git'

mod 'azure_key_vault',
  :git => 'https://github.com/TraGicCode/tragiccode-azure_key_vault'
