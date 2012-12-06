Description
===========

syntax_fix gem goes through all files and directories and change the old Ruby 1.8 syntax to a new one.

Features
========

What we've got so far:

* change hash style from ':key => "value"' to 'key: "value"'

Install
=======

`gem install syntax_fix`

OR

Put this line in your Gemfile:
`gem 'syntax_fix'`

Then bundle:
`$ bundle`

Usage
=======

`syntax_fix` command will check and rewrite all files with the new syntax (including nested files and directories)

`-h` or `--help` - output all the possible arguments that you can pass from a command line

`-v` or `--verbose` - be verbose about the actions

`-p [PATH]` or `--path [PATH]` - specify the relative path  to start actions from
