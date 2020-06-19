# C2C upgrade tool

c2c upgrade is a bash tool to upgrade c2c machines to the new version 20.04.


# Discription

In summary c2c upgrade tool automatically performs the following maintenance processes without any need of user interference :

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

first you need to:

* Backup all your data very important.

* git clone using:

git clone https://github.com/omohammed95/Upgrade


