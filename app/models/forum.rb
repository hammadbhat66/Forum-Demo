class Forum < ApplicationRecord
   mount_uploader :avatar, AvatarUploader
   belongs_to :user
   has_many :comments, dependent: :destroy
   scope :featured_list, -> {order("viewed DESC").limit(3)}

  	def self.updateit(id)
  	  	@forum = self.find(id)
  		if @forum.viewed == nil
  			@forum.viewed = 1
  		else	
  	  		@forum.viewed = @forum.viewed + 1
  		end
  	  	@forum.save!
  	  	puts @forum.viewed
  	end


end
