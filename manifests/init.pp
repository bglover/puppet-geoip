# == Class geoip
#
# Class to manage GeoIP datafile distribution.
#
class geoip {
  # Default filemode: -rw-r--r--
  $filemode = '0644'

  # Where the datafile will be stored.
  $geoipdir = '/usr/share/GeoIP'

  # Globally set the filemode, owner and group.
  File {
    mode  => $filemode,
    owner => 'root',
    group => 'root'
  }

  # Ensure the directory exists on the server.
  # Recursively populate the directory with the given source.
  file { $geoipdir:
    ensure  => directory,
    source  => 'puppet:///modules/geoip/',
    recurse => true
  }
}
