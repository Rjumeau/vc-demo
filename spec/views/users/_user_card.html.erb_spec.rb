require 'rails_helper'

RSpec.describe 'users/_user_card', type: :view do
  let(:user) { create(:user,
                      first_name: "John",
                      last_name: "Doe",
                      role: "teacher_assistant",
                      available: true
                      ) }

  before { render partial: 'users/user_card', locals: { user: user } }

  it 'shows correct role badge for teacher assistant' do
    expect(rendered).to have_css('.badge.bg-secondary', text: 'TA')
  end
end


# RSpec.describe Card::UserComponent do
#   let(:user) { build(:user) }
#   subject(:component) { described_class.new(user: user) }

#   describe "#badge_role_class" do
      # subject {component.badge_role_class}

#     context "when user is teacher" do
#       before { allow(user).to receive(:teacher?).and_return(true) }

#       it "returns teacher badge class" do
#         is { is_expected.to eq("bg-primary"))
#       end
#     end


#     context "when user is ta" do
#       before { allow(user).to receive(:teacher_assistant?).and_return(true) }

#       it "returns TA badge class" do
#         is { is_expected.to eq("bg-secondary"))
#       end
#     end
#   end
# end
