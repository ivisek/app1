class CardNumber < ActiveRecord::Base

#  validates_length_of :card_number, :minimum => 14, :maximum => 16, :message => 'must be M or F'
#  validates_format_of :card_number, :with => /\A()\Z/i, :on => :create
  

  validates :number, :presence => true, :length => 13..16, :numericality => true, :uniqueness => true
  
  
end