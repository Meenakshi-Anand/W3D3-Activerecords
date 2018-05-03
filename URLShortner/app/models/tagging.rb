class Tagging < ApplicationRecord
  validates :url_id, presence: true
  validates :topic_id, presence: true
  
  belongs_to :url,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :ShortenedURL
  
  belongs_to :topic,
  primary_key: :id,
  foreign_key: :topic_id,
  class_name: :TagTopic
  
end