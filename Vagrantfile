# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define :master do |node|
    node.vm.provider "virtualbox" do |vb|
   #   # Display the VirtualBox GUI when booting the machine
   #   vb.gui = true
   #
   #   # Customize the amount of memory on the VM:
      vb.memory = "8192"
   end
    node.vm.box = "puppetlabs/centos-7.0-64-puppet"
    node.vm.box_check_update = false
    node.vm.hostname = 'master.vagrantup.internal'
    node.vm.network :private_network, :ip => '10.0.42.2'
    node.vm.network "forwarded_port", guest: 443, host: 1443
    node.vm.network "forwarded_port", guest: 8140, host: 18140
    node.vm.network "forwarded_port", guest: 8808, host: 18808
    node.vm.provision :hosts, :sync_hosts => true
    node.vm.provision :hosts do |provisioner|

        # Or as many aliases as you like!
        provisioner.add_host '10.0.42.2', [
          'master.vagrantup.internal',
          'puppet.vagrantup.internal',
          'master',
          'puppet'
        ]
      end

    #node.vm.add_host '10.0.42.2', ['puppet.vagrantup.internal','puppet']

    node.vm.synced_folder "../puppet_modules", "/etc/puppetlabs/code-test/modules"
    node.vm.synced_folder ".", "/var/cache/control_repo"
    node.vm.synced_folder "./site-modules/localbootstrap/files", "/etc/puppetlabs/r10k"
    node.vm.provision "shell", inline: <<-SHELL
    # stop firewall
    sudo systemctl stop firewalld #if you wnat it back use puppetlabs/firewall
    sudo yum install tree -y
    sudo yum install git -y
    sudo yum install pdk -y #for reasons
    sudo yum install puppet-bolt -y #for reasons
    # to update puppet
    # see https://docs.puppet.com/puppet/4.7/release_notes.html#puppet-471 for version
    #sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    # puppet module install puppetlabs-puppet_agent into /tmp/modules of the repository before you try use this

    # arbitery puppet usage in this case to update the agent
    # module install commands here
      #sudo /opt/puppetlabs/bin/puppet module install puppetlabs-puppet_agent --modulepath=/etc/puppetlabs/code/modules
:w

      #sudo /opt/puppetlabs/bin/puppet apply -e "class{'puppet_agent': package_version=>'1.10.12'}"



 #if you want to set up pe mom
 version=2019.1.0
 tarball="puppet-enterprise-${version}-el-7-x86_64"
      if [ -f "/home/vagrant/$tarball.tar.gz" ]
      then
        echo "$tarball exists"
      else
        sudo DOWNLOAD_VERSION=${version}  /var/cache/control_repo/site-modules/localbootstrap/tasks/puppet_download.sh
      fi
      if [ -f "/root/${tarball}/puppet-enterprise-installer" ]
      then
        echo "Puppet Enterprise installer is available"
      else
      sudo tar -xvzf /home/vagrant/"${tarball}".tar.gz -C /root/
      fi
      if [ -d "/etc/puppetlabs/enterprise" ]
      then
        echo "Puppet Enterprise is installed"
      else
        sudo /root/"${tarball}"/puppet-enterprise-installer -c /var/cache/control_repo/site-modules/localbootstrap/files/pe.conf
        sudo puppet agent -t && sudo puppet agent -t
        echo 'make sure you change the default password!! if using this in production'
      fi


  #if you are running as a development agent, uncomment these lines
  #yum install git -y
  #/opt/puppetlabs/puppet/bin/gem install r10k
  #/opt/puppetlabs/puppet/bin/r10k deploy environment -p

    SHELL

    node.vm.provision "puppet" do |puppet|
      puppet.options = "--verbose --debug"
      #puppet.module_path = "modules"
      puppet.manifests_path = './manifests'
      puppet.manifest_file = "site.pp"
    end

  end
  config.vm.define :aiocentos do |node|
    node.vm.provider "virtualbox" do |vb|
   #   # Display the VirtualBox GUI when booting the machine
   #   vb.gui = true
   #
   #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
   end
    node.vm.box = "puppetlabs/centos-7.0-64-puppet"
    node.vm.box_check_update = false
    node.vm.hostname = 'aiocentos.vagrantup.internal'
    node.vm.network :private_network, :ip => '10.0.42.3'
    node.vm.provision :hosts, :sync_hosts => false
    node.vm.provision :hosts do |provisioner|

        # Or as many aliases as you like!
        provisioner.add_host '10.0.42.3', [
          'aiocentos.vagrantup.internal',
          'aiocentos'
        ]
      end

    #node.vm.add_host '10.0.42.2', ['puppet.vagrantup.internal','puppet']

    node.vm.synced_folder "../", "/etc/puppetlabs/code/test"

    node.vm.synced_folder ".", "/var/cache/control_repo"
    node.vm.synced_folder "./site-modules/localbootstrap/files", "/etc/puppetlabs/r10k"
    node.vm.provision "shell", inline: <<-SHELL
    # stop firewall
    sudo systemctl stop firewalld #if you wnat it back use puppetlabs/firewall
    yum install tree -y #for reasons
    # to update puppet
    # see https://docs.puppet.com/puppet/4.7/release_notes.html#puppet-471 for version
    #sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    # puppet module install puppetlabs-puppet_agent into /tmp/modules of the repository before you try use this

    # arbitery puppet usage in this case to update the agent
    # module install commands here
      sudo /opt/puppetlabs/bin/puppet module install puppetlabs-puppet_agent --modulepath=/etc/puppetlabs/code/modules

      sudo /opt/puppetlabs/bin/puppet apply -e "class{'puppet_agent': package_version=>'1.10.12'}"



  #if you are running as a development agent, uncomment these lines
      yum install git -y
      /opt/puppetlabs/puppet/bin/gem install r10k
      /opt/puppetlabs/puppet/bin/r10k deploy environment -p

    SHELL

    node.vm.provision "puppet" do |puppet|
      puppet.options = "--verbose --debug"
      #puppet.module_path = "modules"
      puppet.manifests_path = './manifests'
      puppet.manifest_file = "site.pp"
    end

  end
  config.vm.define :centosagent01 do |node|
    node.vm.provider "virtualbox" do |vb|
   #   # Display the VirtualBox GUI when booting the machine
   #   vb.gui = true
   #
   #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
   end
    node.vm.box = "puppetlabs/centos-7.0-64-puppet"
    node.vm.box_check_update = false
    node.vm.hostname = 'centosagent01.vagrantup.internal'
    node.vm.network :private_network, :ip => '10.0.42.10'
    node.vm.provision :hosts, :sync_hosts => true
    node.vm.provision :hosts do |provisioner|

        # Or as many aliases as you like!
        provisioner.add_host '10.0.42.10', [
          'centosagent01.vagrantup.internal',
          'centos-agent01'
        ]
        provisioner.add_host '10.0.42.2', [
          'puppet.vagrantup.internal',
          'master.vagrantup.internal',
          'puppet',
          'master'
        ]
      end


    node.vm.provision "shell", inline: <<-SHELL
    # stop firewall
    sudo systemctl stop firewalld #if you wnat it back use puppetlabs/firewall
    yum install tree -y #for reasons
    # to update puppet
    # see https://docs.puppet.com/puppet/4.7/release_notes.html#puppet-471 for version
    #sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    # puppet module install puppetlabs-puppet_agent into /tmp/modules of the repository before you try use this

    # arbitery puppet usage in this case to update the agent
    # module install commands here
      sudo /opt/puppetlabs/bin/puppet module install puppetlabs-puppet_agent --modulepath=/etc/puppetlabs/code/modules

      sudo /opt/puppetlabs/bin/puppet apply -e "class{'puppet_agent': package_version=>'1.10.12'}"

      sudo /opt/puppetlabs/bin/puppet agent -t

    SHELL

  end
end
