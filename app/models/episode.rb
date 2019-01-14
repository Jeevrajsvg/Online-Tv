class Episode < ApplicationRecord
  belongs_to :season

  validates :title,:plot, presence: true
end
