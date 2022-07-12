class Wine < ApplicationRecord
    has_many :blends
    has_many :strains, through: :blends

    validate :check_percentage

    accepts_nested_attributes_for :blends,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes[:percentage].to_i <= 0 }
    def check_percentage
        percentages = self.blends.map { |blend| blend.percentage }
        total_percentage = percentages.sum

        unless total_percentage == 100
            errors.add(:blends, "Los ensablajes deben sumar 100%")
        end
    end

end
