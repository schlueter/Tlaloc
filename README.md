# Tlaloc

Tlaloc (named for [Tlaloc](http://en.wikipedia.org/wiki/Tlaloc), Aztec god of water) is a pipeline service for performing Chef runs on remote machines, placing arbitrary files (logs, compiled binaries, etc.) somewhere you can retrieve them, and sending you an email notification.

Tlaloc is built on a number of technologies including Vagrant, Chef, and numerous Amazon Web Services as well as Postfix. In the future I hope to decouple from AWS, but for now, it's cheap and easy to start with.

## Overview

[//]: # (TODO add Dropbox support)

A Tlaloc run is just a customized Vagrant run initiated with a `vagrant up`. It will use a few environment variables for AWS configuration, and utilizes the Vagrant-AWS plugin to launch an Amazon EC2 instance. The Vagrant-Omnibus plugin is used to install chef on the instance, and then Chef-solo is run as a provisioner. The run included in this repository is meant to be added to, for testing, or compilation, or whatever; it sends an email late in the chef run which can be customized for your needs. Additionaly, the chef run also includes an encrypted upload to Amazon S3 (Dropbox soon), for which a url can be generated, and sent in the email. After completion of the chef run, the instance will be shut down.

## Requirements

There are a few requirements for this magic to happen.

OS, no hard requirement, but I've only tested with:

- OSX (10.9.3, but anything should work so long as all the requirements do)

Environment variables:

- `AWS_ACCESS_KEY_ID` needs to be set to your aws access key id
- `AWS_SECRET_ACCESS_KEY` needs to be set to your aws secret access key

Vagrant plugins (can be installed with `vagrant plugin install <plugin-name>`):

- `vagrant-aws` (tested with version 0.4.1)
- `vagrant-omnibus` (tested with version 1.4.1)

[//]: # (TODO Make less annoying. Maybe with Dropbox)

And the annoying bit, creating an S3 bucket:

- an S3 bucket must be created, if you don't name it 'tlaloc', you need to set the `tlaloc: { aws: { bucket: <bucket name> }}` property in the `chef.json` variable in the Vagrantfile.

## Goodwill & a disclaimer

Goodwill to those of you who find this, and best of luck in your legitimate endeavors. This is intended for legal uses, and not to be utilized for anything less than that. Use at your own risk. It also bears the posibility of costing you a bunch of money as is, so if you break the bank, that's not my fault either.
