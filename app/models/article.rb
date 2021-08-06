class Article < ActiveRecord::Base
<<<<<<< HEAD
    belongs_to :user, class_name: "user", foreign_key: "user_id"
=======
    has_rich_text :description
>>>>>>> 04cf7e3de885fa3a257af573f503d1e5ccaa7f36
    validates :title, presence: true, length: {minimum:3, maximum:50}
    validates :description, presence: true, length: {minimum:10, maximum:10000}
end