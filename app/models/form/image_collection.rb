class Form::ImageCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :images

  def initialize(attributes = {})
    binding.pry
    super attributes
    # インスタンスを5つ作り、配列の中に格納する
    self.images = FORM_COUNT.times.map{ Image.new() } unless self.images.present?
  end

  def images_attributes=(attributes)
    binding.pry
    self.images = attributes.map { |k, v| Image.new(v) }
  end

  def save
    Image.transaction do
      self.images.map(&:save!)
    end
      return true
    rescue => e
      return false
  end

end
