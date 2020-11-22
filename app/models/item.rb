class Item < ApplicationRecord
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :burden
    belongs_to :area
    belongs_to :delivery

    with_options presence: true do
        validates :image
        validates :comments
        validates :name
        validates :price, numericality: {greater_than: 299, less_than: 10000000, only_interger: true}

        with_options numericality: { other_than: 1 } do
            validates :category_id
            validates :status_id
            validates :burden_id
            validates :area_id
            validates :delivery_id
        end
    end
end