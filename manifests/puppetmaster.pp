# = Class: browscap::puppetmaster
#
# Manages cron entry on the puppetmaster for the downloading the php_browscap.ini.
#
# == Parameters:
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
class browscap::puppetmaster (
  $cron_user    = 'root',
  $cron_weekday = '3',
  $cron_hour    = '23',
  $cron_minute  = '0'
  $ini_location = '/etc/puppet/modules/browscap/files/php_browscap.ini'
){
  # Define the cron with the update command and schedule.
  cron { 'browscap_download':
    command => "/usr/bin/curl http://browscap.org/stream?q=Full_PHP_BrowsCapINI -o ${ini_location}",
    user    => $cron_user,
    weekday => $cron_weekday,
    hour    => $cron_hour,
    minute  => $cron_minute
  }
}
