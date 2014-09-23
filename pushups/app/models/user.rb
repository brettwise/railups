class User < ActiveRecord::Base

	def self.from_omniauth(auth)
		where(:provider => auth["provider"], :uid => auth["uid"].to_s).first || 
		create_with_omniauth(auth)
	end

 # Other than looking at the docs is there a way for me to look at the code and 
 # determine that I would need to useself.create_with_omniauth to do this?
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end