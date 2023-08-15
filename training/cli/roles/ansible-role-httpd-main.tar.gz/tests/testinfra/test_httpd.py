def test_httpd_is_installed(host):
    httpd = host.package("httpd")
    assert httpd.is_installed
    assert httpd.version.startswith("2.4.")

def test_httpd_executable(host):
    httpd = host.file("/usr/sbin/httpd")
    assert httpd.exists
    assert httpd.user == "root"
    assert httpd.group == "root"
    assert httpd.mode == 0o755

def test_httpd_config_file(host):
    httpd_config = host.file("/etc/httpd/conf/httpd.conf")
    assert httpd_config.exists
    assert httpd_config.user == "root"
    assert httpd_config.group == "root"
    assert httpd_config.mode == 0o640