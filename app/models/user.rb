class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  enum role: { teacher: 0, teacher_assistant: 1, batch_manager: 3}

  scope :order_by_tickets_count, -> { order(tickets_solved_count: :desc)}

  scope :teaching_staff, -> { where.not(role: :batch_manager)}

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def batch_count_sentence
    return "Not an alumni" unless batch_count
    "Batch #{batch_count}"
  end
end
