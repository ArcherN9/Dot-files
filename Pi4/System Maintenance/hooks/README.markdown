# Configuring System Hooks

```
# For Further reading on the subject, Refer the Arch Wiki
# https://wiki.archlinux.org/title/Pacman#Hooks
```

Pacman can run pre- and post- hooks from a pre-defined directory
`/usr/share/libalpm/hooks`. Files stored here are auto executed after
any package installation/uninstallation activity on the system.

I use this feature to keep a Package List and a Yay List up to date automatically
in case I have to reinstall my Arch setup. The two Hook files provided in this
directory should be system linked to the Hooks directory to ensure all package
changes can be version controlled.

```sh
$ cd /usr/share/libalpm/hooks
# ln [SOURCE] [TARGET]
$ ln -s $HOME/.dot-files/Pi4/System\ Maintenance/Hooks/custom-pkglist.hook \
    `pwd`/custom-pkglist.hook

# Do the exact same command, swapping out the file name with custom-yaylist.hook`
```

To test your setup, try installing a trivial piece of software. You should see
something similar post installation:

```sh
(x/x) Updating Pacman package list under user dot files
(x/x) updating Yay package list under user dot files
```

