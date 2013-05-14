require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ApplicationTest < Test::Unit::TestCase
  context "Application Model" do
    should 'construct new instance' do
      @application = Application.new
      assert_not_nil @application
    end
  end
end
