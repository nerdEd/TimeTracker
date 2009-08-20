require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe Entry do 
  
  describe "validations" do 
    
    before( :each ) do 
      @entry = Entry.new( :date => Date.today, :hours => 4, :activity => "Development", :description => "Adding tests.", :project => "PAS" )
    end
    
    it "should be valid with valid attributes" do
      @entry.should be_valid
    end
    
    it "should not be valid without a date" do
      @entry.date = nil
      @entry.should_not be_valid
    end
    
    it "should not be valid without hours" do 
      @entry.hours = nil
      @entry.should_not be_valid
    end
    
    it "should not be valid with non-numeric hours" do
      @entry.hours = 'Ed'
      @entry.should_not be_valid
    end
    
    it "should not be valid without an activity" do
      @entry.activity = nil
      @entry.should_not be_valid
    end
    
    it "should not be valid without a description" do 
      @entry.description = nil
      @entry.should_not be_valid
    end
    
    it "should not be valid without a project" do 
      @entry.project = nil
      @entry.should_not be_valid
    end
    
    it "should not be valid if 24 hours are already billed for it's day" do
      entry_two = Entry.new( :date => Date.today, :hours => 24, :activity => "Development", :description => "Adding tests.", :project => "PAS" )
      @entry.user_id = entry_two.user_id = 1
      @entry.save
      entry_two.should_not be_valid
    end
    
  end
  
end