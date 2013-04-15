java::setup { 'jdk_6u35':
  ensure        => present,
  source        => 'jdk-6u35-linux-x64.tar.gz',
  deploymentdir => '/home/jude/jdk',
}
