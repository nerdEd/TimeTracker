class Entry < ActiveRecord::Base
  belongs_to :user
  named_scope :within_range, lambda { | start_date, end_date | { :conditions => [ "date >= ? AND date <= ?", start_date, end_date ] } }

  validates_presence_of :date, :hours, :activity, :description, :project
  validates_numericality_of :hours
  validate :cannot_exceed_24_hours_in_one_day  
    
  def cannot_exceed_24_hours_in_one_day
    unless hours == nil
      hours_sum = Entry.sum( :hours, :conditions => [ "user_id = ? AND date = ?", user_id, date ] )
      if( new_record? ) then hours_sum += hours end
      if( hours_sum > 24 )
        errors.add( date.to_s, "cannot have more than 24 hours billed" )
      end
    end
  end
  
end