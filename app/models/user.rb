class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  enum role: { teacher: 0, teacher_assistant: 1, batch_manager: 3}

  scope :order_by_tickets_count, -> { order(tickets_solved_count: :desc)}

  scope :teaching_staff, -> { where.not(role: :batch_manager)}

  TOPICS = ["Ruby & Ruby on Rails", "Javascript", "HTML & CSS", "Projects"].freeze

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def batch_count_sentence
    return "Not an alumni" unless batch_count
    "##{batch_count}"
  end

  def image_url_displayed
    image_url.presence || "default-avatar.jpg"
  end
end
