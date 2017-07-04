class Tag < ApplicationRecord
	has_many :taggings
	has_many :photos, through: :taggings

	searchkick match: :word_start, searchable: [:name]
end
