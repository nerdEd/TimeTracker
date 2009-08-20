class EntriesController < ApplicationController
  
  def index
    
    # WARNING: this assumes we've been given good date strings
    start_date = params[ :start_date ] == nil ? nil : Date.parse( params[ :start_date ] )
    end_date = params[ :end_date ] == nil ? nil : Date.parse( params[ :end_date ] )
    
    user = User.find_by_id( params[ :user_id ] )
      
    @entries = user.entries_for_range( start_date, end_date )
      
  end
  
  def new
    @user = User.find_by_id( params[:user_id])
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  def create
    @entry = Entry.new(params[:entry])    
    @user = User.find_by_id( params[:user_id])
    @user.entries << @entry
    
    respond_to do |format|
      if @entry.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to user_entries_path( @user ) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end