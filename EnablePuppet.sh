#!/bin/bash


function enable_puppet {
        # checks if puppet agent is enable
	FILE=/opt/puppetlabs/puppet/cache/state/agent_disabled.lock
       if [ -f "$FILE" ]; then
          puppet agent --enable 
	  echo "puppet has been enabled successfully"
        else
	  echo "puppet agent is already enable"
       fi

}

enable_puppet
