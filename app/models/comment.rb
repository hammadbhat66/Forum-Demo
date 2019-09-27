class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :forum
	scope :com_list, ->  (id){where(forum_id: id).order("created_at DESC")}
	validates :comment , presence: :true
end
