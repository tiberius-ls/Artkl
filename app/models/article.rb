class Article < ActiveRecord::Base
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    validates :title, presence: true, length: {minimum:3, maximum:50}
    validates :description, presence: true, length: {minimum:10, maximum:10000}
end