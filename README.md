# netcat-based chat

Did you know that you could run a chat service using only netcat?

## Requirements

* `ncat`, for both servers and clients
* (optional) `mawk`

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
