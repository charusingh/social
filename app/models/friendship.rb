class Friendship < ActiveRecord::Base
  belongs_to :user
def common_with
            joins("inner join friendships on friendships.friend_id
          = user_id").where("friend_id = #{friend.id}")

 end
end
