# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'aws'

Vagrant.configure('2') do |config|
  config.omnibus.chef_version = '11.12.2'
  config.vm.box_url          = 'https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.box               = 'ubuntu-12.04-amd64' 

  config.vm.provider :virtualbox do |vb, override|
    vb.name = 'Tlaloc'
  end

  config.vm.provider :aws do |aws, override|
    aws.access_key_id     = ENV['AWS_ACCESS_KEY_ID'],
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.ami               = 'ami-7747d01e'
    aws.availability_zone = 'us-east-1'

    override.base_box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'
    override.ssh.username = 'ubuntu'
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'tlaloc'

    chef.custom_config_path = 'ssl_fix.chef'
    chef.json = {
      amazon_ses: {
        access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      },
      tlaloc: {
        torrents: File.open('torrents').readlines.map{ |l| l.strip }
      }
    }
  end
end
