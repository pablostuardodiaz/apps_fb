require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ParticipationTest < Test::Unit::TestCase
  context "Participation Model" do
    should 'construct new instance' do
      @participation = Participation.new
      assert_not_nil @participation
    end
  end
end
