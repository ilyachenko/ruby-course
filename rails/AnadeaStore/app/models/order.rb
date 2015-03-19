class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Order < ActiveRecord::Base

  has_many :order_products
  has_many :products, :through => :order_products

  validates :shipping, presence: true
  validates :email, presence: true, email: true

end
