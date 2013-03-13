module SyntaxFix
  class Checker
    attr_accessor :verbose, :rel_path

    def fix_code(path)
      dirfile = SyntaxFix::DirFile.new(path)
      if dirfile.is_dir?
        Dir.foreach(path) do |name|
          current_item = SyntaxFix::DirFile.new([path, name].join('/'))
          current_item.is_dir? ? fix_code(current_item.path) : fix_file(current_item)
        end
      elsif dirfile.is_file?
        fix_file dirfile
      end
    end

    private
    def fix_file(current_item)
      return unless current_item.correct_file?
      content = current_item.read_file
      fixed_content = fix_syntax(content)
      if content != fixed_content
        current_item.write_file(fixed_content)
        puts "#{current_item.path} [CHANGED]" if verbose
      end
    end

    def fix_syntax(source)
      source.gsub(/([^\:])\:([a-zA-Z_0-9]*)(\s*)=\>(\s*)/){|match| "#{$1}#{$2}:#{$3.empty? || ($3+$4).empty? ? " " : $3}"}
    end
  end
end
