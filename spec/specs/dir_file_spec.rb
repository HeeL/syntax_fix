require 'spec_helper.rb'

describe SyntaxFix::DirFile do
  before(:all) do
    @path = "#{File.expand_path('.')}/spec/fixtures"
  end

  it "checks if current item is a dir" do
    dir = SyntaxFix::DirFile.new("#{@path}/nested")
    dir.is_dir?.should be_true
  end

  it "checks if current item is a file" do
    file = SyntaxFix::DirFile.new("#{@path}/test.rb")
    file.is_file?.should be_true
  end

  it "returns false when dir is '..'" do
    dir = SyntaxFix::DirFile.new("#{@path}/nested/.")
    dir.is_dir?.should be_false
  end

  it "doesn't read files with dat extension" do
      not_correct = SyntaxFix::DirFile.new("#{@path}/not_rb.dat")
      not_correct.correct_file?.should be_false
  end

  it "reads files with rb extension" do
      correct = SyntaxFix::DirFile.new("#{@path}/test.rb")
      correct.correct_file?.should be_true
  end

  it "reads the given file" do
    dir = SyntaxFix::DirFile.new("#{@path}/nested/nested.rb")
    dir.read_file.should == 'nested.rb'
  end

  it "puts given source into a file" do
    path = "#{@path}/nested/not_rb.txt"
    File.truncate(path, 0)
    file = SyntaxFix::DirFile.new(path)
    file.write_file('not_rb.txt')
    file.read_file.should == 'not_rb.txt'
  end

end
