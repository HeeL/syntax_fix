$:.push File.expand_path(File.dirname(__FILE__))
require "syntax_fix/version"

SyntaxFix.autoload :Checker, 'syntax_fix/checker.rb'
SyntaxFix.autoload :DirFile, 'syntax_fix/dir_file.rb'
