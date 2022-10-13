[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

Oracle Linux "Ansible Ready" Packaged by Bmeme
=========

CentOs "Ansible Ready" images based on [official Oraccle Linux repository](https://hub.docker.com/_/oraclelinux), currently used by Bmeme for its 
`molecule` tests during Ansible Role development.

## What is contained in the images
* ansible, of course
* initscripts
* sudo
* which
* python3
* python3-libs
* python3-pip 

## Supported tags and respective `Dockerfile` links
- `8.6`, `8`, `latest` [Dockerfile](https://github.com/bmeme/docker-ansible-ol/blob/main/8/8.6/Dockerfile)

## Credits
This project is a contribution of [Bmeme :: The Digital Factory](http://www.bmeme.com).
This library is actually maintained by [Daniele Piaggesi](https://github.com/g0blin79), 
[Roberto Mariani](https://github.com/jean-louis) and [Michele Mondelli](https://github.com/Mithenks).
Any other contribution will be really appreciated.