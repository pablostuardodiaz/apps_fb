require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ParticipantTest < Test::Unit::TestCase
  context "Participant Model" do
    should 'construct new instance' do
      @participant = Participant.new
      assert_not_nil @participant
    end
  end
end
