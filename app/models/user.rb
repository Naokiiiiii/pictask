class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys:[:email]
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
    sql = "select domain from groups where name='#{group_key}'"
    domain=ActiveRecord::Base.connection.select_all(sql).rows.join
      unless /#{domain}/ === email
        errors[:base] << "学校のemailを登録してください"
      end
  end

end
