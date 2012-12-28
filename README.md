#java

Puppet module to manages Oracle JDK or JRE deployments. This module provides a custom resource definition (java::setup) that deploys any version of Oracle's JRE or JDK

##Definition:

##java::setup

###Actions:
Deploys Oracle's JDK or JRE to target deployment directory.

###Parameters:
		ensure        - (required) present or absent. Present by default
		source        - (required) Puppet path to the source JDK or JRE tar.gz
		pathfile      - (optional) Path to file where JAVA_HOME is appended to $PATH. Defaults to '/etc/bashrc'
		cachedir      - (optional) Working directory to use for extracting Oracle's JRK or JRE. Defaults to "/var/run/puppet/java_setup_working-${name}"
		deploymentdir - (optional) Destination/deployment directory for JDK or JRE. Defaults to /opt/oracle-java
		
###Sample Usage:

Deploy JDK-7u7-x64 to /opt/jdk-7u7-x64 and append JAVA_HOME to $PATH in /etc/bashrc

		java::setup { 'jdk_7u7':
		  ensure        => present,
		  source        => 'jdk-7u7-linux-x64.gz',
		  deploymentdir => '/opt/jdk-7u7-x64',
		}

### Frequently asked questions

#### Why deploy multiple versions of JDK or JRE on one node ?

Say you have two applications that are compatible with different versions of JDK or JRE then you deploy one version of JDK or JRE in the home directory of application 1 and another version of JDK/JRE in application2's home dir. Then update ~/.bashrc to point to the local deployment of JDK/JRE