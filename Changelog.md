# ncat-chat changelog

## v1.0.0

This is the first release of ncat-chat. And probably the only one, let's be honest.

This tool is a minimalist chat server/client using `ncat`.

There are two bash scripts: `ncat-server.sh` & `ncat-client.sh`, although they could probably be portable for another shell.

As expected, the server script open a server, waiting for connections. And the client connects to the server, enabling discussion. Please see the `README.md` file for basic and advanced usage.

### BIG DISCLAIMER

**THIS SOLUTION IS BY NO MEAN PRODUCTION-SAFE. IT'S A TOY.**

### Basic features

* Server and client scripts use SSL by default.
* Customization / configuration via environment variables
  * Server configuration: listening port.
  * Client configuration: server hostname, port, username, color.
* Usage help available via `./ncat-server -h` or `./ncat-client.sh -h`
* Compatible with `rlwrap` if you want to use the arrow keys to edit your message, browse your history, etc.
* Thorough documentation in the `README.md` file for further details on usage and options.
