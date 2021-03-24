# netcat-based chat

Did you know that you could run a chat service using only `netcat`/`ncat`?

## BIG DISCLAIMER

**This solution is by no mean production-safe. It's a toy.**

* It doesn't use encryption between clients and servers,
* Anybody can usurp anybody's identity, there's no control on the usernames.
* `ncat` is a hell of a tool, but even if it has a quite large `--max-conns` argument (set to 100 on \*Nix, 60 on Windows), there's no guarantee that it can handle the network traffic or the CPU load.

## Requirements

* `ncat` for servers,
* `netcat` (a.k.a. `nc`) for clients,
* `mawk` (optional, only used in a "bare-bones" example below).

## License

Since this client/server toolkit is basically stolen from here and there examples found on the Internet, that wouldn't be fair to assign a privative license to it.

So this piece of software is published under the terms of the WTFPL (v2).

Copyright © 2021 Bruno Bord <bruno@jehaisleprintemps.net>
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.

## Running the server

### "Bare bones" servers

A "Bare bones" server would run using:

```sh
ncat --broker --listen -p <port-number>
```

You may assign any (available) port number for your server.

Another way is to use the `--chat` parameter of ncat. But it prefixes every message with an arbitrary identifier. It makes you sure that nobody is usurpating your identity, but it might not be readable to have `<user1>`, `<user2>` or `<user3>` talking to each other.

### Our ncat server

For your convenience, we're providing a `.sh` script. The following will run a server on port `12345`.

```sh
./ncat-server.sh
```

If you want to specify a dedicated port, you may use the following:

```sh
CHAT_PORT=<port-number> ./ncat-server.sh
```

## Running a client

### "Bare bones" clients

Run a chat client using:

```sh
nc <server-address-or-hostname> <port-number>
```

*Tip*: you can even test this on your own PC, in two separate shell sessions, where the server hostname would be: `localhost`.

If you want to make sure that your username/nickname is sent each time you're sending a message, you may try to use `mawk` along:

```sh
mawk -W interactive '$0="Alice: "$0' | nc <server-address-or-hostname> <port-number>
```

### Our client

For your convenience, there's even a `.sh` script. If you want to connect to the default server on your PC, run:

```sh
./ncat-client.sh
```

You'll then be connected to the server on `localhost` on port `12345`. But the discussion here will be limited, since you'll be the only person speaking. And if you open another shell and run the same command, and try to write messages, you'll see that all messages are prefixed by your username (extracted from the result of the `whoami` command).

Similarly to the server port, you can also use environment variables to change your connection parameters. See the following example:

```sh
CHAT_HOST=alice-laptop CHAT_PORT=9999 CHAT_USER=Bob ./ncat-client.sh
```

#### Colors

You may chose the color with which your messages will be received by the other users. By default, no specific colour will be sent along. If you want to change that, use the `CHAT_COLOR` environment variable, such as:

```sh
CHAT_COLOR=cyan ./ncat-client.sh
```

Available colors:

* `red`
* `green`
* `yellow`
* `blue`
* `magenta`
* `cyan`
* `white`

If you're providing an unknown color, the "no-color" will be used.
