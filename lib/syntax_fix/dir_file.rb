module SyntaxFix
  class DirFile
    attr_accessor :check_exts
    attr_reader :path

    def initialize(path)
      @path = path
      @check_exts = ['rb', 'erb', 'rake', 'haml']
    end

    def is_dir?
      File.directory?(@path) && !['.', '..'].include?(File.basename(@path))
    end

    def correct_file?
      File.file?(@path) && File.writable?(@path) && check_exts.include?(File.extname(@path)[1..-1])
    end

    def write_file(source)
      File.open(@path, 'w') {|f| f.write(source)}
    end

    def read_file
      File.open(@path, 'r') {|f| f.read}
    end
  end
end