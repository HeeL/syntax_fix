require 'spec_helper.rb'

describe SyntaxFix::Checker do
  before(:each) do
    @path = "#{File.expand_path('.')}/spec/fixtures"
  end

  it "fixes hash syntax" do
    fixed_content = File.open("#{@path}/test/fixed_test.txt") {|f| f.read}
    checker = SyntaxFix::Checker.new
    SyntaxFix::DirFile.any_instance.should_receive(:write_file).with(fixed_content)
    checker.fix_code("#{@path}/test")
  end

end