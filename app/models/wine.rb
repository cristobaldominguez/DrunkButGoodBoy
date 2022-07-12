class Wine < ApplicationRecord
    has_many :blends
    has_many :strains, through: :blends

    validate :check_percentage

    after_save :delete_blends_without_percentage

    accepts_nested_attributes_for :blends,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes[:percentage].blank? }

    def check_percentage
        percentages = self.blends.map { |blend| blend.percentage }
        total_percentage = percentages.sum

        unless total_percentage == 100
            errors.add(:blends, "Los ensablajes deben sumar 100%")
        end
    end

    def delete_blends_without_percentage
        blends_without_percentage = self.blends.where(percentage: 0)
        unless blends_without_percentage.size < 1
            blends_without_percentage.destroy_all
        end
    end
end
