class Product < ApplicationRecord
  belongs_to :destination, optional: true

  validates :name, :category, :price, :reference, presence: true

  def find_destination
    ActiveRecord::Base.connection.execute <<-SQL.squish
      SELECT `destinations`.`id`,
      SUM(case when `destinations`.`references` LIKE '%#{reference}%' then 1 else 0 end) +
      SUM(case when `destinations`.`categories` LIKE '%#{category}%' then 1 else 0 end) +
      SUM(case when `destinations`.`names` LIKE '%#{name}%' then 1 else 0 end) +
      SUM(case when `destinations`.`prices` LIKE '%#{price}%' then 1 else 0 end) as rating
      FROM destinations
      ORDER BY rating
      LIMIT 1;
    SQL
  end

  def set_destination
    matched_destination = find_destination.first
    matched_destination_id = matched_destination['rating'] > 0 ? matched_destination['id'] : nil
    self.destination_id = matched_destination_id
  end
end
