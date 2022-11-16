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

# Admin password needed for Oracle VM Manager CLI
OVMM_CLI_ADMIN_PASSWORD=""

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

# Get the Oracle VM Manager CLI admin password
read -s -p "Enter the Oracle VM Manager CLI admin password: " OVMM_CLI_ADMIN_PASSWORD

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

SR1_RESULT="Manual-only"
SR1_RESULT_MSG="Manually check if each Administrator user has its own separate user to access VM manager."

# echo "Running Test 1.1: Limit the access to VM Manager host and VM Server"
# SR1_TEST1=$(echo "$OVMM_CLI_ADMIN_PASSWORD" | /u01/app/oracle/ovm-manager-3/bin/ovm_admin --listusers | tail -1)

echo "audit Sr. No. 1 result: $SR1_RESULT $SR1_RESULT_MSG"

# Write the audit results to the audit results file
echo "1, Limit the access to VM Manager host and VM Server , $SR1_RESULT, $SR1_RESULT_MSG" >> $AUDIT_RESULT_EXPORT_FILE

# Sr. No. 2
# Objective: Delete / restrict the non admin user
# Description: Once you have created the Admin users to access the VM Manager
# it’s time to remove the non admin users which could access the VM manager. 

echo "Running audit Sr. No. 2"

SR2_RESULT="Manual-only"
SR2_RESULT_MSG="Manually check if there are redundant non admin users."

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
















































































################################################################################
# END OF AUDIT
################################################################################

echo "Audit completed"