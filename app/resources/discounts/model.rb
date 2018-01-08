class Resources::Discounts::Model
  def initialize(attributes)
    @attributes = attributes
    @errors = []
  end

  attr_reader :attributes, :errors

  def valid?
    @errors = []
    @errors << "Code must be set" if attributes[:code].to_s.strip.empty?
    errors.empty?
  end

  def save!
    puts "Products::Model#save - #{attributes.inspect}"
    # Calls stored procedure instead of using AR
  end
end
