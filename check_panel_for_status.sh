#!/bin/bash
# Function check user root
f_check_root () {
    if (( $EUID == 0 )); then
        # If user is root, continue to function f_sub_main
        f_sub_main
    else
        # If user not is root, print message and exit script
        echo "Please run this script by user root !"
        exit
    fi
}

# Function check control panel version.
f_check_version () {
	if [[ -f /usr/local/cpanel/cpanel ]]
        then
               PANEL_TYPE="cPanel"
	elif [[ -f /usr/local/psa/version ]]
	then
		PANEL_TYPE="Plesk"
	elif [[ -f /usr/local/directadmin/custombuild/build ]]
	then
		PANEL_TYPE="DirectAdmin"
        elif [[ -f /usr/local/vesta/bin/v-list-sys-vesta-updates ]]
        then
                PANEL_TYPE="VestaCP"
        else
                PANEL_TYPE="Other"
	fi
        echo "$PANEL_TYPE"
}

# The sub main function, use to call neccessary functions of installation
f_sub_main () {
    f_check_version
    sleep 1
}

# The main function
f_main () {
    f_check_root
}
f_main

exit
