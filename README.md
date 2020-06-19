# C2C upgrade tool

c2c upgrade is a bash tool to upgrade c2c machines to the new version 20.04.


# Discription

In summary c2c upgrade tool automatically performs the following maintenance processes without any need of user interference:

* Installs needed dependencies
* Disable puppet agent
* Checks if prompt is set as LTS if not it will switch it to LTS
* Diable the PPAs (Personal Package Archives)
* Updates package lists
* Updates packages and libraries
* Removes unneeded packages
* Removes unused config files
* Removes package files that can no longer be downloaded and everything except the lock file in /var/cache/apt/archives, including directories.

# Usage

First you need to:

* Backup all your data very important.

* git clone using:

  git clone https://github.com/omohammed95/Upgrade

** We decided to separate our script in to two parts in order to reboot the machines manually after running the first script.

* Run as admin(root)

* Run the first script using: bash update_c2c.sh
  two important points to verify: if puppet is disabled (if /opt/puppetlabs/puppet/cache/state/agent_disabled.lock exist it means puppet agent has been disabled).normally it can be done by the script but we need to verify just to be sure. secondly we if PPAs disabled (make sure that the .deb is commented in docker-ce.list slack-desktop.list user.list in /etc/apt/sources.list.d/).

* Reboot the machine.
* Now you need to run the command: bash version_upgrade.sh

 Just follow the instructions the prosses will take 20-30 min. you will be successfuly upgraded to the new version of ubuntu 20.04.   


