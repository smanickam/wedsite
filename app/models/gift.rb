class Gift < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :gifter, :allow_nil => true, 
    :with => /^.{2,20}$/i,
    :message => "must be between 2 and 20 characters long. It is not case-sensitive, i.e. it doesn't matter if you have the caps lock on/off."

  HUMANIZED_ATTRIBUTES = {
    :gifter => "Codename"
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
