class Cat < ApplicationRecord

    validates :birth_date, :description, :name, presence: true
    validates :color, inclusion: {  in: %w[black white speckled calico orange] }
    validates :sex, inclusion: { in: ['M', 'F', 'N'] }
    # validates :status, inclusion: { in: %w[pending active inactive] }

    has_many cat_rentals,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy
end