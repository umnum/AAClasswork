class CatRentalRequest < ApplicationRecord

    validates :start_date, :end_date, presence: true
    validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED'] }

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

end
