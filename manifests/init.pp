# == Class browscap
#
# Class to manage browscap datafile distribution.
#
class browscap {
  # Default filemode: -rw-r--r--
  $filemode = '0644'

  # Where the datafile will be stored.
  $browscapdir = '/etc'

  # The filename of the browscap file.
  $browscapfile = 'php_browscap.ini'

  # Ensure the file exists on the server with the proper permissions.
  file { "${browscapdir}/${browscapfile}":
    ensure  => file,
    mode    => $filemode,
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/browscap/${browscapfile}"
  }
}
