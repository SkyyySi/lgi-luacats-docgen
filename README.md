# lgi-luacats-docgen

Automatically generate static type definitions for LGI (Lua GObject Introspection) for use with Lua Language Server

To use, just run `gen-all-type-headers.sh` (I think - I haven't used this in a while to be honest).

**WARNING**: This is *really* slow and will probably fail to load. A possible solution would be to modify the script to omit any comments, only leaving the type information, but I haven't tested that.
