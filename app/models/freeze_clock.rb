class FreezeClock < ActiveRecord::Base
  attr_accessible :now

  def self.now
    instance.now
  end

  def self.now=(val)
    instance.tap do |f|
      f.now = val
      f.save!
    end
  end

  def self.instance
    first_or_create! do |f|
      f.now = Date.today
    end
  end
end
