# frozen_string_literal: true

class Card::UserComponent < ViewComponent::Base
  renders_one :actions

  def initialize(user:)
    @user = user
  end

  private

  attr_reader :user

  def badge_role
    {
      teacher_assistant: "bg-secondary",
      teacher: "bg-primary"
    }.fetch(user.role, "bg-primary")
  end

  def badge_available
    if user.available?
      { text: "Disponible", bg_class: "bg-success" }
    else
      { text: "Indisponible", bg_class: "bg-danger" }
    end
  end

  def user_avatar(width:, height:, optional_classes: "")
    avatar_classes = "rounded-circle object-fit-cover #{optional_classes.strip}"
    image_tag user.image_url_displayed,
                  alt: user.full_name,
                  width: width,
                  height: height,
                  class: avatar_classes

  end
end
