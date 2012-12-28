java
===========

Puppet module to manages Oracle JDK or JRE deployments. This module provides a custom resource definition (java::setup) that deploys any version of Oracle's JRE or JDK

##Definition:

##java::setup

###Actions:
Deploys Oracle's JDK or JRE to target deployment directory.

###Parameters:
		ensure        - present or absent. Present by default
		source        - Puppet path to the source JDK or JRE tar.gz
		deploymentdir - Destination/deployment directory for JDK or JRE. Defaults to /opt/oracle-java
		pathfile      = '/etc/bashrc',
		cachedir      = Working directory to use for extraction Oracle's JRK or JRE. Defaults to "/var/run/puppet/java_setup_working-${name}"
