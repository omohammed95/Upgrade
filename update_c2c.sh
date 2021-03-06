#!/bin/bash  -x

function LogRight {

        # Checking if the user has run the script with "sudo" or not
       if [[ $EUID -ne 0 ]] ; then
        clear
        echo ""
        echo "c2c upgrade tool must be run as root or with sudo. Now I will just exit..." 1>&2
        echo ""
        sleep 2
        exit 1
       fi
}

function setup {

  	# check to install the needed  dependencies
  	#install deborphan
  	apt install deborphan

}
greeting() {

     echo "_______________________________________________________"
	echo "                                                       "
	echo "            C2C UPGRADE TOOL UBUNTU 20.04            "
	echo "            ~~~~~~~~~~~~~~~~~~~~~                      "
	echo "                                                       "
	echo " Welcome to all-in-one System Update and maintenance   "
	echo " assistant app.                                        "
	echo "                                                       "
	echo "                                                       "
	echo " This simple script will automatically         	     "
	echo " refresh your packagelist, download and                "
	echo " install updates (if there are any), remove any old    "
	echo " kernels, obsolete packages and configuration files    "
	echo " to free up disk space, without any need of user       "
	echo " interference                                          "
	echo "                                                       "
	echo "           VERSION   1.0            "
	echo "_______________________________________________________"
	echo
	echo " C2C UGRADE TOOL will start in 5 seconds... "

	sleep 6

}


function DISABLE_PUPPET {
        # this function will check ifpuppet agent disabled in the system or not
	FILE=/opt/puppetlabs/puppet/cache/state/agent_disabled.lock
       if [ -f "$FILE" ]; then
          echo "puppet agent has already disabled"
       else
         puppet agent --disable "puppet will be disabled because the system is upgrading to new release"
	 echo "Puppet has been diabled successfully!!  "
       fi

}

function SWITCH_TO_LTS {
        #this function will check if  the  prompt is set as lts if not it will switch it to lts.
        TEST=cat | grep "Prompt=lts" /etc/update-manager/release-upgrades 
        if [ "$TEST" = "0" ]; then
           echo "prompt is already set in lts"
        else
           echo "Switching to the 'lts' release channel (if 'never' or 'normal')"
           sed -i -E 's/Prompt=(never|normal)/Prompt=lts/g' "/etc/update-manager/release-upgrades"


        fi

}

function DISABLE_PPAs {
        #this function will add the # character in lines that begin with deb.
	for i in docker-ce.list slack-desktop.list user.list
	do
        sed -i -E 's/^/#/' /etc/apt/sources.list.d/$i
	echo "files has been modified successfully"
	done


}


function UPDATE_C2C {
        echo
        echo
        echo "#########################"
        echo "          Started"
        echo "#########################"
        echo

        ## Updates package lists
        apt update;
        echo
        echo "###############################"
        echo "Finished updating package lists"
        echo "###############################"
        sleep 1
## Updates packages and libraries
        apt full-upgrade;
        echo
        echo "###############################################"
        echo "Finished updating packages and system libraries"
        echo "###############################################"
        sleep 1
        echo

        ## Removes unneeded packages
        apt --purge autoremove;
        echo
        echo "###################################"
        echo "Finished removing unneeded packages"
        echo "###################################"
        sleep 1
        echo
        ## Removes unused config files
        deborphan -n --find-config | xargs apt --purge autoremove;
        echo
        echo "#####################################"
        echo "Finished removing unused config files"
        echo "#####################################"
        sleep 1
        echo
        ## Removes package files that can no longer be downloaded and everything except
        # the lock file in /var/cache/apt/archives, including directories.
        apt autoclean; apt clean;
        echo
        echo "######################################"
        echo " Cleaned downloaded temporary packages"
        echo "######################################"
        echo
	echo
        echo "######################################"
        echo " You need to reboot the machine manually in order to upgrade to ubuntu version 20.04"
        echo "######################################"
        echo


}


LogRight
setup
greeting
DISABLE_PUPPET
SWITCH_TO_LTS
DISABLE_PPAs
UPDATE_C2C
