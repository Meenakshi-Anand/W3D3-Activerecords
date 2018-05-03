class ShortenedURL < ApplicationRecord
  
  validates :short_url , presence: true, uniqueness: true 
  validates :long_url, presence: true
  validates :user_id, presence: true 
  
  def self.random_code
    code = SecureRandom::urlsafe_base64
    until !ShortenedURL.exists?(short_url: code)
      code = SecureRandom::urlsafe_base64
    end
    code
  end
  
  def self.create_short_url(user, long)
    short = ShortenedURL.random_code
    ShortenedURL.create!(user_id: user.id, short_url: short, long_url: long)
  end
  
  def num_clicks
    visitors.count
  end
  
  def num_uniques
    visitors.select(:user_id).distinct.count
  end
  
  def num_recent_uniques
    visitors.select(:user_id).where('created_at > ?', 10.minutes.ago).distinct.count
  end
  
  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
  
  has_many :visitors,
  primary_key: :id,
  foreign_key: :short_url_id,
  class_name: :Visit
  
  has_many :tags,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :Tagging
  
  
  
end 