class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         after_create :build_profile

   has_many :posts, dependent: :destroy
   has_many :comments
   has_one :profile, dependent: :destroy

   def build_profile
   	Profile.create(user: self)
   end
   
end
