# Minibookshop

http://40ants.com/weblocks/quickstart.html

https://github.com/40ants/weblocks/blob/reblocks/docs/source/quickstart.rst

https://gitlab.com/vindarel/cl-bookshops

! In development, don't look ! (but it's awesome)

## Usage

### From the REPL

    (ql:quickload "minibookshop")

    (minibookshop:start)
    <INFO> [17:06:25] weblocks/server server.lisp (start) -
    Starting weblocks WEBLOCKS/SERVER::PORT: 40000
    WEBLOCKS/SERVER::SERVER-TYPE: :HUNCHENTOOT DEBUG: T
    <INFO> [17:06:25] weblocks/server server.lisp (start-server) -
    Starting webserver on WEBLOCKS/SERVER::INTERFACE: "localhost"
    WEBLOCKS/SERVER::PORT: 40000 DEBUG: T
    #<SERVER port=40000 running>

thus open your browser on http://localhost:40000/bookshops

<!-- TODO: make something on default "/". -->

### Build and run a binary

    make build

and

    ./minibookshop

## Installation

Needs weblocks (reblocks), weblocks-ui, weblocks-parenscript & our cl-bookshops in QL's local projects.

https://github.com/vindarel/cl-bookshops

https://github.com/40ants/weblocks-ui
https://github.com/40ants/weblocks-parenscript
https://github.com/40ants/weblocks-navigation-widget

See `make clone`.


## Troubleshooting

    (weblocks/debug:reset-latest-session)

> can not find action: 022tdefe…

reload the page.


    ./minibookshop
    #<THREAD "main thread" RUNNING {1008E56993}>:
    Error opening shared object "libssl.so.1.0.2":
    libssl.so.1.0.2: cannot open shared object file: No such file or directory.

<!-- todo -->
install what's needed.
