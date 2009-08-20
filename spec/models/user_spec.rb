require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe User do 
  
  describe "validations" do 
    
    it "should be valid with valid attributes" do
      User.new( :name => "Ed" ).should be_valid
    end
    
    it "should not be valid without a name" do 
      User.new().should_not be_valid
    end
    
  end
  
end
