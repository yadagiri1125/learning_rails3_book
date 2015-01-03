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
end

