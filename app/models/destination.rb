class Destination < ApplicationRecord
  serialize :names
  serialize :references
  serialize :categories
  serialize :prices
end
