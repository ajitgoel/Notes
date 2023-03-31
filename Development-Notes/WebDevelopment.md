### Difference between ./, ../, / and ~/**

https://stackoverflow.com/questions/31435921/difference-between-and

For the sake of completeness ...

-   Just `path` is a file or directory named `path` in the current directory.
-   `./path` is a file or directory named `path` in the current directory, with the directory spelled out. The dot directory `.` represents the current directory, and `path` is the name of the file or directory within this directory.
-   `~/path` is a shorthand for `$HOME/path` where `$HOME` is a variable which refers to your home directory. Typically your home directory will be somewhere like `/home/you` or `/Users/you` where `you` is your account name. (The command `echo "$HOME"` will display your home directory.) The expanded value is an absolute path (unless you have messed up the value of `$HOME` thoroughly), as indicated by the initial slash.
-   ==`/path` is an absolute path which refers to a file or directory named `path` which is in the _root_ directory `/`.== Every file on Unix is ultimately somewhere in the directory tree which starts with the root directory.

A file name which begins with `$` includes the value of a shell variable in its name (like for example `$HOME` above); you have to know the value of that variable to determine whether it ends up containing a relative or an absolute path. Similarly, `~` at the beginning of a file name gets replaced ("expanded") by the shell to a different string, as outlined above. (Technically, it's possible for a file name to begin with a literal dollar sign or tilde, too; you would then have to quote or backslash-escape that character to avoid having the shell expand it to something else. This is rather inconvenient, so these file names tend to be rare in practice.)
In the following exposition, we refer to the result of any such replacements, and ignore the complication of possible quoting.
==Every file name which begins with `/` is an **absolute** path (aka _full path)_ which explains how to reach a particular node starting from the root directory.== For example, `/var/tmp/you/reminder.txt` refers to a file or directory `reminder.txt` (probably a file, judging from the name; but Unix doesn't care what you call your files or directories) which is in the directory `you` which is in the directory `tmp` which is in the directory `var` which is in the root directory.
==Every file name which doesn't begin with `/` is a **relative** path which indicates how to reach a particular file or directory starting from the current directory.== The special directory `..` is the parent directory and the special directory `.` is the current directory. So `path/there` refers to the file or directory `there` inside the directory `path` in the current directory; and (hover the mouse over the gray area to display the spoiler)

In addition to `~/` for the current user's home directory, some shells and applications allow the notation `~them/` to refer to the home directory of the user account `them`. Also, some web server configurations allow each user to have a public web site in their directory `~/public_html` and the URL notation `http://server/~them/` would serve up the site of the user account `them` for outside visitors.

The **current directory** is a convenience which the shell provides so you don't have to type long paths all the time. You can, if you want to.

```
/bin/ls /home/you/Documents/unix-101/directories.txt
```

is a longwinded but perfectly valid way to say (assuming you are in your home directory),

```
ls Documents/unix-101/directories.txt
```

You could also say

```
cd Documents/unix-101
ls directories.txt
```
and until you `cd` again, all your commands will run in this directory.
See [What exactly is current working directory?](https://stackoverflow.com/questions/45591428/what-exactly-is-current-working-directory) for a longer exposition of this related concept.
A "directory" is sometimes called a "folder" by people who are not yet old enough to prefer the former.
Tangentially, don't confuse the directory name `.` with the Bourne shell command which comprises a single dot (also known by its Bash alias `source`). The command
```
. ./scriptname
```
runs the commands from the file `./scriptname` in the context of the current shell instance, as opposed to in a separate subshell (which is what just `./scriptname` does). In other words, this command line invokes the _dot command_ on a file `scriptname` in the _dot directory._
The Bourne shell (and derivatives like Bash, Zsh, etc) use single quotes to prevent variable expansion and wildcard expansion, and double quotes to permit variable expansion, but inhibit wildcard expansion in a string. The quoting rules on Windows are different, and generally use double quotes to keep whitespace-separated values as a single string (and `%` instead of `$` for variable substitutions).

`./` means "starting from the current directory". `.` refers to the current working directory, so something like `./foo.bar` would be looking for a file called `foo.bar` in the current directory. (As a side note, ==`..` means refers to the parent directory of the current directory.== So `../foo.bar` would be looking for that file one directory above.)
`~/` means "starting from the home directory". This could have different meanings in different scenarios. For example, in a Unix environment `~/foo.bar` would be looking for a file called `foo.bar` in your home directory, something like `/home/totzam/foo.bar`. In many web applications, `~/foo.bar` would be looking for a file called `foo.bar` in the web application root, something like `/var/http/mywebapp/foo.bar`.