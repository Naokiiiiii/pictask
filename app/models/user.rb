class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys:[:email, :group_key]
  has_many :tasks
  belongs_to :group

  attr_accessor :group_key

  before_validation :group_key_to_id

def group_key_to_id
  group = Group.where(name: group_key).first
  self.group_id = group.id
end

validate :domain_check

def domain_check
##sql文で特定のドメインをget
sql = "select domain from groups where name='#{group_key}'"
##取得したdomainの配列を除去し、string型で取得
domain=ActiveRecord::Base.connection.select_all(sql).rows.join
##取得したstring型のdomainをemailと正規表現でmatch
unless /#{domain}/ === email
  errors[:base] << "学校のemailを登録してください"
end
end

end
