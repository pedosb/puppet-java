# Define: java::setup
#
# This module manages Oracle JDK and JRE deployments
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
define java::setup (
  $ensure        = 'present',
  $source        = undef,
  $deploymentdir = '/opt/oracle-java',
  $updatepath    = '/etc/bashrc',
  $cachedir      = "/var/run/puppet/java_setup_working-${name}") {
  /* Validate input values for $ensure */
  if !($ensure in ['present', 'absent']) {
    fail('Parameter ensure must either be present or absent')
  }

  /* Resource default for Exec */
  Exec {
    path => ['/sbin', '/bin', '/usr/sbin', '/usr/bin'], }

  /* When ensure => present */
  if ($ensure == 'present') {
    file { "${cachedir}":
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '644'
    }

    file { "${cachedir}/${source}":
      source  => "puppet:///modules/${module_name}/${source}",
      require => File[$cachedir],
    }

    exec { "extract_java-${name}":
      cwd     => "${cachedir}",
      command => "mkdir extracted; tar -C extracted -xzf *.gz && touch ${cachedir}/.java_extracted",
      creates => "${cachedir}/.java_extracted",
      require => File["${cachedir}/${source}"],
    }

    exec { "create_target-${name}":
      cwd     => '/',
      command => "mkdir -p ${deploymentdir}",
      creates => $deploymentdir,
      require => Exec["extract_java-${name}"],
    }

    exec { "move_java-${name}":
      cwd     => "${cachedir}/extracted",
      command => "cp -r */* ${deploymentdir}/ && touch ${deploymentdir}/.puppet_java_${name}_deployed",
      creates => "${deploymentdir}/.puppet_java_${name}_deployed",
      require => Exec["create_target-${name}"],
    }
  }

  /* When ensure => absent */
  if ($ensure == 'absent') {
    file { "${deploymentdir}":
      ensure  => absent,
      recurse => true,
      force   => true,
    }

    file { "${cachedir}":
      ensure  => absent,
      recurse => true,
      force   => true,
    }
  }
}

