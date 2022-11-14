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



################################################################################
# END OF AUDIT
################################################################################

echo "Audit completed"