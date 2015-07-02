class Kitten < ActiveRecord::Base
    VALID_NUMBER_REGEX = /[0-9]+/
	validates :name, presence: true
	validates :age, presence: true, format: {with: VALID_NUMBER_REGEX}
	validates :cuteness, presence: true, format: {with: VALID_NUMBER_REGEX}
	validates :softness, presence: true, format: {with: VALID_NUMBER_REGEX}

end
