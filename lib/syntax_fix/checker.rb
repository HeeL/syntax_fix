module SyntaxFix
  class Checker
    def fix_code(path)
      Dir.foreach(path) do |name|
        current_item = SyntaxFix::DirFile.new([path, name].join('/'))
        current_item.is_dir? ? fix_code(current_item.path) : fix_file(current_item)
      end
    end

    private
    def fix_file(current_item)
      return if !current_item.correct_file?
      content = current_item.read_file
      fixed_content = fix_syntax(content)
      current_item.write_file(fixed_content) if content != fixed_content
    end

    def fix_syntax(source)
      source.gsub(/[^\:]\:([a-zA-Z_0-9]*)(\s*)=\>(\s*)/){|match| "#{$1}:#{$2.empty? || ($2+$3).empty? ? " " : $2}"}
    end
  end
end