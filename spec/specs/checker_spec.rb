require 'spec_helper.rb'

describe SyntaxFix::Checker do
  before(:each) do
    @path = "#{File.expand_path('.')}/spec/fixtures"
  end

  it "fixes hash syntax when a directory is passed as path argument" do
    fixed_content = File.open("#{@path}/test/fixed_test.txt") {|f| f.read}
    checker = SyntaxFix::Checker.new
    SyntaxFix::DirFile.any_instance.should_receive(:write_file).with(fixed_content)
    checker.fix_code("#{@path}/test")
  end

  it "fixes hash syntax when a file is passed as path argument" do
    fixed_content = File.open("#{@path}/test/fixed_test.txt") {|f| f.read}
    checker = SyntaxFix::Checker.new
    SyntaxFix::DirFile.any_instance.should_receive(:write_file).with(fixed_content)
    checker.fix_code("#{@path}/test.rb")
  end

  it "does nothing when a wrong filename is passed as path argument" do
    fixed_content = File.open("#{@path}/test/fixed_test.txt") {|f| f.read}
    checker = SyntaxFix::Checker.new
    SyntaxFix::DirFile.any_instance.should_not_receive(:write_file).with(fixed_content)
    checker.fix_code("#{@path}/wrong.rb")
  end

end
