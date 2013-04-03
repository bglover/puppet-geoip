# = Class: geoip::puppetmaster
#
# Manages cron entry on the puppetmaster for the geoipupdate program.
#
# == Parameters:
#
# *license_key*
#   Your license key as provided by MaxMind.
#
# *user_id*
#   Your user id as provided by MaxMind.
#
# *product_ids"
#   A string of the product ids registered to your MaxMind account.
#
# *cron_user*
#   The user the crontab should be added to.
#
# *cron_weekday*
#   The day of the week to run the cron job.
#   0 = Sunday, 7 = Saturday
#
# *cron_hour*
#   The hour of the day to run the cron job.
#
# *cron_minute*
#   The minute of the hour to run the cron job.
#
class geoip::puppetmaster (
  $license_key,
  $user_id,
  $product_ids,
  $cron_user    = 'root',
  $cron_weekday = '3',
  $cron_hour    = '23',
  $cron_minute  = '0'
){
  package { GeoIP:
    ensure => installed
  }

  # Contents of the GeoIP.conf
  $geoip_conf = "LicenseKey ${license_key}\nUserId ${user_id}\nProductIds ${product_ids}"

  # Define the configuration.
  # Owner, group and mode are what the default installation of GeoIP use.
  file { '/etc/GeoIP.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $geoip_conf
  }

  # Define the cron with the update command and schedule.
  cron { 'geoipupdate':
    command => '/usr/bin/geoipupdate -d /etc/puppet/modules/geoip/files/',
    user    => $cron_user,
    weekday => $cron_weekday,
    hour    => $cron_hour,
    minute  => $cron_minute
  }
}
