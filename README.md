# Ansible role `netdata`

An Ansible role for setup a netdata.

This role use this bash script: `https://github.com/netdata/netdata/raw/master/packaging/installer/kickstart.sh`

## Requirements

- CentOS >= 9
- ansible >= 2.10

## Role Variables

For more info on the values, read `defaults/main.yml`

| Variable                          | Default                                                              | Comments (type)                             |
| :-------------------------------- | :------------------------------------------------------------------- | :------------------------------------------ |
| `netdata_installation_type`       | `tarball`                                                            | One of `docker`, `tarball` or `package`     |
| `netdata_release`                 | `2.0.1`                                                              | Type: string                                |
| `netdata_tarball_checksum`        | `sha256:xxx`                                                         | Type: string                                |
|                                   |                                                                      | Is required for `tarball` installation type |
| `config_dir`                      | For tarball: `/opt/netdata/etc/netdata`                              |                                             |
|                                   | For package: `/etc/netdata`                                          |                                             |
|                                   | For docker: `"{{ netdata_docker_dir }}/volumes/netdata/etc/netdata"` |                                             |
| `netdata_docker_dir`              | `/opt/netdata-docker`                                                | Directory for `docker-compose` files        |
| `netdata_ksm_enabled`             | `true`                                                               | Type: bool                                  |
| `netdata_required_packages_extra` | `[]`                                                                 | Type: list                                  |
| `netdata_required_packages`       | `epel-release`                                                       | Type: list                                  |
| `netdata_packages_extra`          | `[]`                                                                 | Type: list                                  |
| `netdata_packages`                | `iproute`                                                            | Type: list                                  |
|                                   | `nmap-ncat`                                                          |                                             |
|                                   | `lm_sensors`                                                         |                                             |
|                                   | `python`                                                             |                                             |
|                                   | `python-dns`                                                         |                                             |
|                                   | `python-ipaddress`                                                   |                                             |
| `netdata_telemetry`               | `false`                                                              | Type: bool                                  |

All `netdata_docker_*` variables only for `docker` installation type.

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

Issues, feature requests, ideas are can be appreciated.

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
