class HomeController < ApplicationController
  def index
@post = current_user.posts.build
if request.post?
   @post = Post.create(params[:post])
end
            users = []
            users << current_user.id
            users << @us.friendships.map(&:friend_id)
            users.flatten!
  end

end
