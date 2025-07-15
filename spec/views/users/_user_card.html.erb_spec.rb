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
