class Product < ActiveRecord::Base
  attr_accessible :birthday, :body_temperature, :can_send_email, :country, :description, :email, :favorite_time, :graduation_year, :name, :price, :secret
 validates_presence_of :name,:description,:email,:message => "hey give proper details"
 validates_format_of :email,
:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
:message => "doesn't look like a proper email address"

validates_uniqueness_of :email, :case_sensitive => false,:message => "has already been entered, you can't sign in twice"
validates_uniqueness_of :email, :case_sensitive => false,
:scope => [:name, :secret],
:message => "has already been entered, you can't sign in twice"

validates_numericality_of :graduation_year, :allow_nil => true,
:greater_than => 1920, :less_than_or_equal_to => Time.now.year,
:only_integer => true

# if person says 'can send email', then we'd like them to fill their
# description in, so we understand who it is we're sending mail to
validates_presence_of :description, :if => :require_description_presence?
# we define the supporting condition here
def require_description_presence?
  self.can_send_email
end

validate :description_length_words # custom validation

def description_length_words
	# only do this validation if description is provided
	unless self.description.blank? then
		# simple way of calculating words: split the text on whitespace
		num_words = self.description.split.length
		if num_words < 5 then
		self.errors.add(:description, "must be at least 5 words long")
		elsif num_words > 50 then
		self.errors.add(:description, "must be at most 50 words long")
		end
	end
end

end

