class UsersController < ApplicationController
  
  # GET /users
  def index
    @users = User.find( :all )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new( params[ :user ] )

    if @user.save
      redirect_to users_path
    else
      format.html { render :action => "new" }
    end
  end
  
  def update_timesheet
    @user = User.find( params[ :id] )
    
    if @user.update_attributes( params[:user] ) 
      flash[ :notice ] = 'TimeSheet Updated Successfully'
      redirect_to edit_timesheet_user_path( @user, :start_date => session[ :start_date ], :end_date => session[ :end_date ] )
    else
      render :action => 'edit_timesheet'
    end    
  end
  
  def edit_timesheet
    @user = User.find( params[ :id] )    
    
    today = Date.today
    default_start_day = today - today.wday
    default_end_day = default_start_day + 6  

    begin
      session[ :start_date ] = params[ :start_date ] == nil ? default_start_day : Date.parse( params[ :start_date ] )
      session[ :end_date ] = params[ :end_date ] == nil ? default_end_day : Date.parse( params[ :end_date ] )
    rescue ArgumentError
      session[ :start_date ] = default_start_day
      session[ :end_date ] = default_end_day
    end
  end
  
end
