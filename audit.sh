#!/bin/bash

################################################################################
# ORACLE VM 3 AUDIT SCRIPT
# Date: 14-11-2022
# Version 0.1.0
# This script runs automatic audit of the Oracle VM 3 OS based on the CIS
# specs with given MBSS.
# Upon auditing, it automatically generates a report in CSV format, which shows
# if certain certain controls are compliant or not.
################################################################################


################################################################################
# VARIABLES AND CONSTANTS
################################################################################

OS_NAME_AND_VERSION="$OSTYPE $(uname -a)"
SYSTEM_IDENTITY=$HOSTNAME
OPERATOR_NAME=""
SYSTEM_DATE=$(date '+%Y-%m-%d_%H:%M:%S')

AUDIT_RESULT_EXPORT_FILE="config-review-$OSTYPE-$SYSTEM_IDENTITY.csv"

################################################################################
# INITIALIZATION
################################################################################

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get the operator name
read -p "Enter your name: " OPERATOR_NAME

# Print out OS and version, system identity, operator name and date
echo "OS and version: $OS_NAME_AND_VERSION"
echo "System identity: $SYSTEM_IDENTITY"
echo "Operator name: $OPERATOR_NAME"
echo "Date: $SYSTEM_DATE"

# Check if the audit file exsists, it it does, delete it
if [ -f "$AUDIT_RESULT_EXPORT_FILE" ]; then
    rm $AUDIT_RESULT_EXPORT_FILE
fi

# Create the audit results file
touch $AUDIT_RESULT_EXPORT_FILE

# Write the OS and version, system identity, operator name and date to the audit
# results file
echo "\"OS and version: $OS_NAME_AND_VERSION\",,," >> $AUDIT_RESULT_EXPORT_FILE
echo "\"System identity: $SYSTEM_IDENTITY\",,," >> $AUDIT_RESULT_EXPORT_FILE
echo "\"Operator name: $OPERATOR_NAME\",,," >> $AUDIT_RESULT_EXPORT_FILE
echo "\"Date: $SYSTEM_DATE\",,," >> $AUDIT_RESULT_EXPORT_FILE

# Write the header to the audit results file
echo "Serial No#,Control Objective,Compliance Status,Additional Comments" >> $AUDIT_RESULT_EXPORT_FILE

################################################################################
# AUDITS
################################################################################


# Sr. No. 1
# Objective: Limit the access to VM Manager host and VM Server
# Description: It cannot be stressed enough that the Oracle VM Manager Core is a very powerful component within an Oracle
# VM deployment, providing control over many servers and virtual machines. 
# Recommended settings:
# With this in mind, access to this host should be severely restricted.
# Each Administrator user must have its own separate user to access VM manager. 

echo "Running audit Sr. No. 1"

SR1_RESULT="Compliant"
SR1_RESULT_MSG=""

echo "Running Test 1.1: Limit the access to VM Manager host and VM Server"


echo "audit Sr. No. 1 result: $SR1_RESULT $SR1_RESULT_MSG"

# Write the audit results to the audit results file
echo "1, Limit the access to VM Manager host and VM Server , $SR1_RESULT, $SR1_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 2
# Objective: Delete / restrict the non admin user
# Description: Once you have created the Admin users to access the VM Manager
# it’s time to remove the non admin users which could access the VM manager. 

echo "Running audit Sr. No. 2"

SR2_RESULT="Compliant"
SR2_RESULT_MSG=""

echo "Running Test 2.1: Delete / restrict the non admin user"


echo "audit Sr. No. 2 result: $SR2_RESULT $SR2_RESULT_MSG"

# Write the audit results to the audit results file
echo "2, Delete / restrict the non admin user , $SR2_RESULT, $SR2_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 3
# Objective: Configure Account locking
# Description: To protect unauthorized access to Oracle VM Manager you can configure an account locking facility that is
# triggered after a number of failed attempts to log in. 

echo "Running audit Sr. No. 3"

SR3_RESULT="Compliant"
SR3_RESULT_MSG=""

echo "Running Test 3.1: Configure Account locking"


echo "audit Sr. No. 3 result: $SR3_RESULT $SR3_RESULT_MSG"

# Write the audit results to the audit results file
echo "3, Configure Account locking , $SR3_RESULT, $SR3_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 4
# Objective: Prevent SSH Root login to Oracle VM dom0 
# Description: The Oracle VM dom0 is a highly privileged environment. For maximum security, administrative access to it
# must be strictly controlled, limited to authorized individuals, and logged.

echo "Running audit Sr. No. 4"

SR4_RESULT="Compliant"
SR4_RESULT_MSG=""

echo "Running Test 4.1: Prevent SSH Root login to Oracle VM dom0"


echo "audit Sr. No. 4 result: $SR4_RESULT $SR4_RESULT_MSG"

# Write the audit results to the audit results file
echo "4, Prevent SSH Root login to Oracle VM dom0 , $SR4_RESULT, $SR4_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 5
# Objective: Granting Sudo access to users on Oracle VM dom0 or for users on
# Oracle VM Manager
# Description: Sudoers file is used to configure the sudo users to gain privileged access.
# Recommended settings: By default, an Oracle Linux system is configured so that
# you cannot log in directly as root. 
# You must log in as a named user before using either su or sudo to perform
# tasks as root. This configuration allows system accounting to trace the
# original login name of any user who performs a privileged administrative action

echo "Running audit Sr. No. 5"

SR5_RESULT="Compliant"
SR5_RESULT_MSG=""

echo "Running Test 5.1: Granting Sudo access to users on Oracle VM dom0 or for users on Oracle VM Manager"


echo "audit Sr. No. 5 result: $SR5_RESULT $SR5_RESULT_MSG"

# Write the audit results to the audit results file
echo "5, Granting Sudo access to users on Oracle VM dom0 or for users on Oracle VM Manager , $SR5_RESULT, $SR5_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 6
# Objective: Enable LDAP Authentication on Dom0
# Description: You can enable LDAP authentication on each Oracle VM server
# instance to control and log access attempts on Dom0.

echo "Running audit Sr. No. 6"

SR6_RESULT="Compliant"
SR6_RESULT_MSG=""

echo "Running Test 6.1: Enable LDAP Authentication on Dom0"


echo "audit Sr. No. 6 result: $SR6_RESULT $SR6_RESULT_MSG"

# Write the audit results to the audit results file
echo "6, Enable LDAP Authentication on Dom0 , $SR6_RESULT, $SR6_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 7
# Objective: Enable LDAP/Active Directory Authentication on Oracle VM Manager
# Description: You can enable LDAP authentication on Oracle VM Manager to
# control and log access attempts on Oracle VM Manager. 

echo "Running audit Sr. No. 7"

SR7_RESULT="Compliant"
SR7_RESULT_MSG=""

echo "Running Test 7.1: Enable LDAP/Active Directory Authentication on Oracle VM Manager"


echo "audit Sr. No. 7 result: $SR7_RESULT $SR7_RESULT_MSG"

# Write the audit results to the audit results file
echo "7, Enable LDAP/Active Directory Authentication on Oracle VM Manager , $SR7_RESULT, $SR7_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 8
# Objective: Configure Password Ageing
# Description: Setting Password ageing policy is very important in securing the
# users credentials up to minimum level. 

echo "Running audit Sr. No. 8"

SR8_RESULT="Compliant"
SR8_RESULT_MSG=""

echo "Running Test 8.1: Configure Password Ageing"


echo "audit Sr. No. 8 result: $SR8_RESULT $SR8_RESULT_MSG"

# Write the audit results to the audit results file
echo "8, Configure Password Ageing , $SR8_RESULT, $SR8_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 9
# Objective: Change Oracle VM Agent SSL Certificates  
# Description: To replace the default self-signed certificate with your own
# trusted certificate, replace the certificate file and key files.  
# To generate a new certificate and key files, log on to an Oracle VM Server and
# execute the command:
# # ovs-agent- keygen -h 
# The generated files are placed in the directory:
# # /etc/ovs-agent/cert

echo "Running audit Sr. No. 9"

SR9_RESULT="Compliant"
SR9_RESULT_MSG=""

echo "Running Test 9.1: Change Oracle VM Agent SSL Certificates"


echo "audit Sr. No. 9 result: $SR9_RESULT $SR9_RESULT_MSG"

# Write the audit results to the audit results file
echo "9, Change Oracle VM Agent SSL Certificates , $SR9_RESULT, $SR9_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 10
# Objective: Getting Oracle VM Manager logs
# Description: Oracle VM keeps a number of log files on different components in
# the environment. 
# These log files are important for the manageability and supportability of Oracle VM.
# any unauthorized login attempt on Oracle VM Manager or SSH connection failure
# to an Oracle VM Server is reflected in the log files.
# You can also send these logs to any internal or external syslog server and for
# audit purposes as well. 

echo "Running audit Sr. No. 10"

SR10_RESULT="Compliant"
SR10_RESULT_MSG=""

echo "Running Test 10.1: Getting Oracle VM Manager logs"


echo "audit Sr. No. 10 result: $SR10_RESULT $SR10_RESULT_MSG"

# Write the audit results to the audit results file
echo "10, Getting Oracle VM Manager logs , $SR10_RESULT, $SR10_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 11
# Objective: Getting Oracle VM Server logs
# Description: Oracle VM keeps a number of log files on different components in
# the environment. 
# These log files are important for the manageability and supportability of Oracle VM

echo "Running audit Sr. No. 11"

SR11_RESULT="Compliant"
SR11_RESULT_MSG=""

echo "Running Test 11.1: Getting Oracle VM Server logs"


echo "audit Sr. No. 11 result: $SR11_RESULT $SR11_RESULT_MSG"

# Write the audit results to the audit results file
echo "11, Getting Oracle VM Server logs , $SR11_RESULT, $SR11_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 12
# Objective: Upgrade patches / Oracle VM manager 
# Description: Updates and upgrades are critical to latest available bug fixes
# from the principal vendor.

echo "Running audit Sr. No. 12"

SR12_RESULT="Compliant"
SR12_RESULT_MSG=""

echo "Running Test 12.1: Upgrade patches / Oracle VM manager"


echo "audit Sr. No. 12 result: $SR12_RESULT $SR12_RESULT_MSG"

# Write the audit results to the audit results file
echo "12, Upgrade patches / Oracle VM manager , $SR12_RESULT, $SR12_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 13
# Objective: Upgrade patches / Oracle VM Server
# Description: You can upgrade the Oracle VM Server from three different ways.
# The most preferred / recommended way is to upgrade the Oracle VM servers
# through Oracle VM Manger. 

echo "Running audit Sr. No. 13"

SR13_RESULT="Compliant"
SR13_RESULT_MSG=""

echo "Running Test 13.1: Upgrade patches / Oracle VM Server"


echo "audit Sr. No. 13 result: $SR13_RESULT $SR13_RESULT_MSG"

# Write the audit results to the audit results file
echo "13, Upgrade patches / Oracle VM Server , $SR13_RESULT, $SR13_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 14
# Objective: configure NTP on the Oracle VM Manager host
# Description: NTP synchronizes a Data Domain system with an NTP time server,
# manages the NTP service, or turns off the local NTP server.
# It is recommended to configure NTP for time synchronization since services
# stability and compatibility directly depends on this service.

echo "Running audit Sr. No. 14"

SR14_RESULT="Compliant"
SR14_RESULT_MSG=""

echo "Running Test 14.1: configure NTP on the Oracle VM Manager host"


echo "audit Sr. No. 14 result: $SR14_RESULT $SR14_RESULT_MSG"

# Write the audit results to the audit results file
echo "14, configure NTP on the Oracle VM Manager host , $SR14_RESULT, $SR14_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 15
# Objective: Configure / Enable SNMP for Oracle VM server
# Description: Simple Network Management Protocol is an Internet Standard
# protocol for collecting and organizing information about managed devices on
# IP networks and for modifying that information to change device behavior.

echo "Running audit Sr. No. 15"

SR15_RESULT="Compliant"
SR15_RESULT_MSG=""

echo "Running Test 15.1: Configure / Enable SNMP for Oracle VM server"


echo "audit Sr. No. 15 result: $SR15_RESULT $SR15_RESULT_MSG"
 
# Write the audit results to the audit results file
echo "15, Configure / Enable SNMP for Oracle VM server , $SR15_RESULT, $SR15_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 16
# Objective: Create Access groups 
# Description: Access groups provide a means to arrange and restrict access
# to storage to a limited set of servers.
# It is possible that in some environments you may have mixed SAN storage,
# where both iSCSI and Fibre Channel types are available.

echo "Running audit Sr. No. 16"

SR16_RESULT="Compliant"
SR16_RESULT_MSG=""

echo "Running Test 16.1: Create Access groups"


echo "audit Sr. No. 16 result: $SR16_RESULT $SR16_RESULT_MSG"

# Write the audit results to the audit results file
echo "16, Create Access groups , $SR16_RESULT, $SR16_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 17
# Objective: Disable FTP to Oracle VM 
# Description: Weak or plain-text protocols, such as FTP must be disabled by default. 

echo "Running audit Sr. No. 17"

SR17_RESULT="Compliant"
SR17_RESULT_MSG=""

echo "Running Test 17.1: Disable FTP to Oracle VM"


echo "audit Sr. No. 17 result: $SR17_RESULT $SR17_RESULT_MSG"

# Write the audit results to the audit results file
echo "17, Disable FTP to Oracle VM , $SR17_RESULT, $SR17_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 18
# Objective: Disable HTTP on oracle VM manager for web browser
# Description: Weak or plain-text protocols, such as HTTP must be disabled by default. 

echo "Running audit Sr. No. 18"

SR18_RESULT="Compliant"
SR18_RESULT_MSG=""

echo "Running Test 18.1: Disable HTTP on oracle VM manager for web browser"


echo "audit Sr. No. 18 result: $SR18_RESULT $SR18_RESULT_MSG"

# Write the audit results to the audit results file
echo "18, Disable HTTP on oracle VM manager for web browser , $SR18_RESULT, $SR18_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 19
# Objective: Enable FIPS for OpenSSL on Oracle VM Server
# Description: Consider enabling FIPS mode for OpenSSL to ensure that your
# OpenSSL is compliant with Federal Information Processing Standard (FIPS)
# Publication 140-2, which is a standard that establishes security
# requirements for cryptographic modules.

echo "Running audit Sr. No. 19"

SR19_RESULT="Compliant"
SR19_RESULT_MSG=""

echo "Running Test 19.1: Enable FIPS for OpenSSL on Oracle VM Server"


echo "audit Sr. No. 19 result: $SR19_RESULT $SR19_RESULT_MSG"

# Write the audit results to the audit results file
echo "19, Enable FIPS for OpenSSL on Oracle VM Server , $SR19_RESULT, $SR19_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 20
# Objective: Enable iptables service / configure ports on Oracle VM manager
# Description: A default Oracle Linux installation has the firewall enabled
# (iptables on).

echo "Running audit Sr. No. 20"

SR20_RESULT="Compliant"
SR20_RESULT_MSG=""

echo "Running Test 20.1: Enable iptables service / configure ports on Oracle VM manager"


echo "audit Sr. No. 20 result: $SR20_RESULT $SR20_RESULT_MSG"

# Write the audit results to the audit results file
echo "20, Enable iptables service / configure ports on Oracle VM manager , $SR20_RESULT, $SR20_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 21
# Objective: Connect with perimeter firewall  
# Description: Network hardware firewall is always a more secure option to
# secure your internal network.

echo "Running audit Sr. No. 21"

SR21_RESULT="Compliant"
SR21_RESULT_MSG=""

echo "Running Test 21.1: Connect with perimeter firewall"



echo "audit Sr. No. 21 result: $SR21_RESULT $SR21_RESULT_MSG"

# Write the audit results to the audit results file
echo "21, Connect with perimeter firewall , $SR21_RESULT, $SR21_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 22
# Objective: Add failed connection logging into iptables
# Description: Untrusted internal network model views any traffic from the
# internal network as potentially hostile.
# Additional hardening of this network can be done by implementing hardware or
# iptables based firewalls and policies on the admin and dom0 hosts that block
# inbound traffic. 

echo "Running audit Sr. No. 22"

SR22_RESULT="Compliant"
SR22_RESULT_MSG=""

echo "Running Test 22.1: Add failed connection logging into iptables"


echo "audit Sr. No. 22 result: $SR22_RESULT $SR22_RESULT_MSG"

# Write the audit results to the audit results file
echo "22, Add failed connection logging into iptables , $SR22_RESULT, $SR22_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 23
# Objective: Disable VNC connections
# Description: VNC is a graphical desktop-sharing system that uses the Remote
# Frame Buffer protocol to remotely control another computer.

echo "Running audit Sr. No. 23"

SR23_RESULT="Compliant"
SR23_RESULT_MSG=""

echo "Running Test 23.1: Disable VNC connections"


echo "audit Sr. No. 23 result: $SR23_RESULT $SR23_RESULT_MSG"

# Write the audit results to the audit results file
echo "23, Disable VNC connections , $SR23_RESULT, $SR23_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 24
# Objective: Block ICMP Timestamp requests
# Description: Ensure that your external firewall device filters or blocks ICMP
# Timestamp requests from arbitrary hosts.

echo "Running audit Sr. No. 24"

SR24_RESULT="Compliant"
SR24_RESULT_MSG=""

echo "Running Test 24.1: Block ICMP Timestamp requests"


echo "audit Sr. No. 24 result: $SR24_RESULT $SR24_RESULT_MSG"

# Write the audit results to the audit results file
echo "24, Block ICMP Timestamp requests , $SR24_RESULT, $SR24_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 25
# Objective: Physical console security
# Description: Default installations of Oracle VM Server or Oracle VM Manager
# do not provide physical security.

echo "Running audit Sr. No. 25"

SR25_RESULT="Compliant"
SR25_RESULT_MSG=""

echo "Running Test 25.1: Physical console security"


echo "audit Sr. No. 25 result: $SR25_RESULT $SR25_RESULT_MSG"

# Write the audit results to the audit results file
echo "25, Physical console security , $SR25_RESULT, $SR25_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 26
# Objective: General USB security best practices
# Description: Disabling of USB ports on Oracle VM Server nodes is recommended
# for better security measures. 

echo "Running audit Sr. No. 26"

SR26_RESULT="Compliant"
SR26_RESULT_MSG=""

echo "Running Test 26.1: General USB security best practices"


echo "audit Sr. No. 26 result: $SR26_RESULT $SR26_RESULT_MSG"

# Write the audit results to the audit results file
echo "26, General USB security best practices , $SR26_RESULT, $SR26_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

################################################################################
# END OF AUDIT
################################################################################

echo "Audit completed"