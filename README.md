andrewrothstein.coredns
=========
![Build Status](https://github.com/andrewrothstein/ansible-coredns/actions/workflows/build.yml/badge.svg)

Installs [CoreDNS](https://coredns.io/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.coredns
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
