require 'rails_helper'

RSpec.describe Card::UserComponent do
  let(:user) { build(:user) }
  subject { described_class.new(user: user) }

  describe "#badge_role" do
    context "when user is TA" do
      before { allow(user).to receive(:teacher_assistant?).and_return(true) }

      it "returns TA badge data" do
        expect(subject.send(:badge_role)).to eq({text: "TA", bg_class: "bg-secondary"})
      end
    end
  end
end
