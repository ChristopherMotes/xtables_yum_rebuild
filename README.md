# xtables_yum_rebuild

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with xtables_yum_rebuild](#setup)
    * [What xtables_yum_rebuild affects](#what-xtables_yum_rebuild-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xtables_yum_rebuild](#beginning-with-xtables_yum_rebuild)
1. [Test - Steps to Unit test module](#test)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description
Installs pieces to ensure yum update/install of the kernel rebuilds the xtables-addon drivers.
This module does NOT rebuild your drivers. That is in yum where it belongs.

Really, you shouldn't be doing  any of this. You should be building an RPM for xtables-addons with each kernel release. 
Then, putting that sucker in a yum repo.  But who wants to do that. This is step one for freeing us to get there.

## Setup

### What xtables_yum_rebuild affects **OPTIONAL**
This only affects the configuration of yum. It does NOT create drivers. 

See the docs for yum-plugin-post-transaction-actions if you can find them. Else, google the hell out of it.


### Setup Requirements **OPTIONAL**

This is turbo-adminy, (Again, build a yum repo). You need to ensure require RPMs isntallation for xtables-addons (See #Test)

### Beginning with xtables_yum_rebuild


## Test
```
   sudo yum -y install local  https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
   sudo yum -y install puppet-agent
   git clone https://github.com/ChristopherMotes/xtables_yum_rebuild.git
   sudo yum -y install gcc kernel-devel-`uname -r` kernel-headers-`uname -r` iptables-devel perl-Text-CSV_XS automake compat-iptables
   sudo /opt/puppetlabs/bin/puppet apply --modulepath=~ec2-user/ -e 'include xtables_yum_rebuild'
   sudo iptables -I INPUT -m geoip --src-cc AE,BD,BH,BR,CN,CO,DM,FR,HK,ID,IN,JP -j DROP
   sudo service iptables save
   sudo yum -y update
   sudo init 6
   ### wait and login in again
   sudo iptables -L
```
## Usage

## Reference


## Limitations

## Development


## Release Notes/Contributors/Etc. **Optional**

