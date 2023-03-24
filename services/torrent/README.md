# Torrent Stack
* All torrent traffic proxied through `wireguard` container with `dante-server` SOCKS5 protocal.
* Below docker services are configured with `healthchecks` that uses [`ip-test.sh`](./ip-test.sh) script to check current connection is secured or not.
  * Set `vpn_ip` variable in `vars.yml` to check external ip is this ip or add the ip in `.vpn_ip` environmental variable in current directory

* `qBittorrnet`
* `radarr`
