import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_netdata_running_and_enabled(host):
    netdata = host.service('netdata')
    assert netdata.is_enabled
    assert netdata.is_running


def test_netdata_is_listen(host):
    socket = host.socket('tcp://127.0.0.1:19999')
    assert socket.is_listening
