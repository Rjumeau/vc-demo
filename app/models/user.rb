class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  enum role: { teacher: 1, teacher_assistant: 2}

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
