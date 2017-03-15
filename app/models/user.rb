# Class User
class User < ApplicationRecord
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'https://www.croop.cl/UI/twitter/images/carl.jpg'  
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :search, -> (term) {
    criteria = [
      "#{quoted_table_name}.email LIKE :term",
      "#{quoted_table_name}.username LIKE :term",
    ]

    where(criteria.join(" OR "), term: "%#{term}%")
  }
  scope :ordered, -> {
    order(arel_table[:created_at].desc, arel_table[:id].desc)
  }

end
