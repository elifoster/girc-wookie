# girc-wookie
[![Gem Version](https://badge.fury.io/rb/girc-wookie.svg)](https://badge.fury.io/rb/girc-wookie)

Quickly adding an IRC web service to a GitHub repository

I made this small project to solve a very minor issue in my development projects. I often found myself forgetting to add the IRC webhook to my projects, or not wanting to take the time to do it.
Since pretty much all my projects have the exact same configuration for their IRC webhooks, I figured I may as well write a script to do it for me with essentially the same configuration.
Thus, this project was born.

## Installation
To install the Wookie, simply execute the following
``` shell
$ gem install girc-wookie
```

## Usage
The Wookie is run with the `wookie` command.

When called on its own (e.g., `$ wookie`) it will output some basic usage information.

It takes a single argument, which is the path to the YAML configuration file. It can be named anything.

``` shell
$ wookie /Users/me/Desktop/wookie.yaml
```

When the script has finished, it will state simply `Finished.` and exit. See below for info about the YAML file.

### Configuration
There is a sample YAML file in the source code named `example.yaml`. It has the following.
* `github` A hash containing information regarding the GitHub user and repository.
  * `username` The username. Optional if `auth_code` is used.
  * `password` The password. Optional if `auth_code` is used.
  * `repo` The repository to add the webhook to.
  * `auth_code` The personal access token. Optional if `username` and `password` are used. This will take priority over user/pass authentication.
* `irc` A hash containing the configuration for the IRC hook.
  * `server` The IRC server.
  * `port` The port. Often this is 6667
  * `room` The IRC room to connect to. Technically, it takes a string with rooms separated by `, `.
  * `branches` The branches to use. Use `null` if you care about all of them.
  * `nickserv_password` The nickserv password to authenticate with. Use `null` if you don't need to authenticate.
  * `ssl` A boolean of whether to use SSL connections or not.
  * `no_join` Whether to NOT join the channel. Use `false` to join, `true` to not join.
  * `no_colors` Whether to NOT use colors. Use `false` if you like colors, or `true` if you don't.
  * `notice` Whether to send the message through a notice.
  * `nick` The nickname to send the messages as.
