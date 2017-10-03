<p align="center">
  <a href="https://zenodo.org">
    <img src="https://github.com/zenodo/developers.zenodo.org/raw/master/source/images/zenodo-black-200.png">
  </a>
  <br>
  <a href="https://travis-ci.org/zenodo/developers.zenodo.org">
    <img src="https://travis-ci.org/zenodo/developers.zenodo.org.svg?branch=master" alt="Build Status">
  </a>
</p>


Getting Started with Zenodo Documentation
-----------------------------------------

### Prerequisites

Zenodo REST API documentation uses [Slate](https://github.com/lord/slate). In
order set things up locally you're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.2.5 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't
   work, just run `gem install bundler` in a terminal.


### Getting Set Up

1. `git clone git@github.com:zenodo/developers.zenodo.org.git`
2. `cd developers.zenodo.org`
3. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
# (you might need to try ``vagrant provision`` first if the service doesn't start)
```

You can now see the docs rendered at http://localhost:4567.

Now that Slate is all set up on your machine, you'll probably want to learn more
about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-
Syntax).

If you'd prefer to use Docker, instructions are available [in the
wiki](https://github.com/lord/slate/wiki/Docker).


### Contributing

Contributions are welcome, and they are greatly appreciated! Every little bit
helps, and credit will always be given.


### Deployment

Zenodo REST API documentation is currently hosted on GitHub pages, and uses
Travis-CI to be built and deployed.
