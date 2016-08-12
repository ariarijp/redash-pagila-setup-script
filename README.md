[Pagila Database](http://pgfoundry.org/projects/dbsamples/) import script for [re:dash](http://redash.io/) VM.

# Requirements

* Git
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

# Usage

Follow the steps below to launch re:dash instance and import Pagila Database.

```bash
$ git clone https://github.com/ariarijp/redash-pagila-setup-script.git
$ cd redash-pagila-setup-script
$ git clone https://github.com/getredash/redash.git
$ cd redash
$ cp ../redash-pagila-setup.sh ./
$ vagrant up
$ vagrant ssh -c "bash /vagrant/redash-pagila-setup.sh"
$ ./bin/vagrant_ctl.sh start
```

Then, open http://localhost:9001

# License

MIT

# Author

[ariarijp](https://github.com/ariarijp)
