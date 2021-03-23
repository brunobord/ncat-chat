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
