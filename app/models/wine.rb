class Wine < ApplicationRecord
    has_many :blends
    has_many :strains, through: :blends

    accepts_nested_attributes_for :blends,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes[:percentage].to_i <= 0 }
end
