# Minibookshop

http://40ants.com/weblocks/quickstart.html

https://github.com/40ants/weblocks/blob/reblocks/docs/source/quickstart.rst

https://gitlab.com/vindarel/cl-bookshops

! In development, don't look ! (but it's awesome)

## Usage

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


## Installation

Needs weblocks (reblocks), weblocks-ui, weblocks-parenscript & our cl-bookshops in QL's local projects.

https://github.com/40ants/weblocks-ui
https://github.com/40ants/weblocks-parenscript
https://github.com/vindarel/cl-bookshops

## Develop

    (weblocks/debug:reset-latest-session)

> can not find action: 022tdefe…

reload the page.
