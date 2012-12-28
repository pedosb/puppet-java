java::setup { 'jdk_7u7':
  ensure        => present,
  source        => 'jdk-7u7-linux-x64.gz',
  deploymentdir => '/opt/jdk-7u7-x64',
}
