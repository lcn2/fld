# fld

Print fields from stdin to stdout.

Print fields, where fields are separated by white space.  Blank lines are ignored.  Fields that do not exist are ignored.

Examples of fields:

    item == 3       => 3rd field
    item == e       => last field
    item == e-2     => third from last field


# To install

```sh
sudo make install
```


# Examples

Print the 1st, 3rd and 5th fields of a file:

```sh
$ /usr/local/bin/fld 1 3 5 < file
```

Print the 1st (IP address) and last fields (final host alias) from `/etc/hosts` that are not comments:

```sh
$ sed -E -e 's/\s*#.*//' /etc/hosts | /usr/local/bin/fld 1 e
```

Print named services and this ports from `/etc/services`:

```sh
$ grep -E '^\w' /etc/services | fld 1 2
```


# To use

```sh
/usr/local/bin/fld [-h] [-v level] [-V] [-N] [field ...]

    -h          print help message and exit
    -v level    set verbosity level (def level: 0)
    -V          print version string and exit

    -N          do not process anything, just parse arguments (def: process something)

    [field ...]	    field number to print, or e ==> last field, or e-X ==> X-th from last field

Exit codes:
     0         all OK
     1         the constructed awk command failed
     2         -h and help string printed or -V and version string printed
     3         command line error
 >= 10         internal error

fld version: 1.3.1 2025-03-30
```


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/fld/security/policy)".
