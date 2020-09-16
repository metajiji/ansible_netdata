# Ansible role `netdata`

An Ansible role for setup a netdata.

This role use this bash script: `https://github.com/netdata/netdata/blob/master/packaging/installer/kickstart-static64.sh`

## Requirements

- CentOS >= 7
- ansible >= 2.7

## Role Variables

For more info on the values, read `defaults/main.yml`

| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `netdata_installation_type` | `tarball` | `tarball` or `package` |
| `netdata_release` | `1.25.0` | Type: string |
| `netdata_tarball_checksum` | `sha256:xxx` | Type: string |
| | | Is required for `tarball` installation type |
| | | Can be obtained by command: `curl -sL https://github.com/netdata/netdata/releases/download/v1.22.1/sha256sums.txt \| grep gz.run` |
| `netdata_stock_config_dir` | `/opt/netdata/usr/lib/netdata/conf.d` | For tarball: `/opt/netdata/usr/lib/netdata/conf.d` |
| | | For package: `/usr/lib64/netdata/conf.d` |
| `netdata_user_config_dir` | `/opt/netdata/etc/netdata` | For tarball: `/opt/netdata/etc/netdata` |
| | | For package: `/etc/netdata`
| `netdata_ksm_enabled` | `true` | Type: bool |
| `netdata_required_packages_extra` | `[]` | Type: list |
| `netdata_required_packages` | `epel-release` | Type: list |
| `netdata_packages_extra` | `[]` | Type: list |
| `netdata_packages` | `iproute` | Type: list |
|                    | `nmap-ncat` | |
|                    | `lm_sensors` | |
|                    | `python` | |
|                    | `python-dns` | |
|                    | `python-ipaddress` | |
| `netdata_telemetry` | `false` | Type: bool |

## Examples

### Playbook

```yml
- hosts: all
  roles:
    - netdata
```

### KSM

This role can enable KSM [[1]], [[2]] via `tmpfiles`.

If `netdata_ksm_enabled` with `true` you can enable KSM manually:

```bash
systemd-tmpfiles --create
```

## Contributing

Issues, feature requests, ideas are can be appreciated

## License

- [WTFPL](http://www.wtfpl.net/)

## Contributors

- [Denis Kadyshev](https://github.com/metajiji/)

## Documentation

- [Netdata Documentation](https://docs.netdata.cloud/)
- [kernel.org ksm.txt][1]
- [Netdata & KSM][2]

[1]: https://www.kernel.org/doc/Documentation/vm/ksm.txt
[2]: https://docs.netdata.cloud/database/#ksm
