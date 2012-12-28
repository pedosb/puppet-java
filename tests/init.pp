java::setup { 'jdk_7':
  ensure        => 'absent',
  source        => 'jdk-7u7-linux-x64.gz',
  deploymentdir => '/opt/oracle-java',
}
