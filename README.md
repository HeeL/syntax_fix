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

Contributing
============

If you consider to contribute to syntax_fix gem, please try to cover your code with tests