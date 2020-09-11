class Goal < ApplicationRecord
    validates :title, :details, :visibility, :user_id, :completed, :finished, :cheers, presence:true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

end
