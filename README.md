# puppet-geoip

Puppet module to manage the distribution of geoip datafiles.

## Requirements

If you do not have a MaxMind license or userid, set the values to standard GeoIP defaults:
<pre><code>
'geoip::puppetmaster::license_key' : 'YOUR_LICENSE_KEY_HERE',
'geoip::puppetmaster::user_id'     : 'YOUR_USER_ID_HERE',
'geoip::puppetmaster::product_ids' : '106'
</code></pre>

## Tested

Tested on CentOS v6.4
