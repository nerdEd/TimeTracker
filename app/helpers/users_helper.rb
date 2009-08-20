module UsersHelper
  
  def add_entry_link( name, parent_form, start_date, end_date )
    button_to_function name do |page| 
      html = render( :partial => 'entry', :locals => { :new_index => "NEW_RECORD", :f => parent_form, :start_date => start_date, :end_date => end_date }, :object => Entry.new )
      page << "$('entries').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
    end
  end 
  
  def options_for_date_span( start_date, end_date, current_value )
    date_options = Array.new
    start_date.upto( end_date ) do | date |
      date_options << [ date.strftime( "%a %b %d %Y" ), date ]
    end
    options_for_select( date_options, current_value )
  end
  
  def time_sheet_link( label, user, start_date, end_date, shift )
    if( start_date == nil || end_date == nil )
      link_to label, edit_timesheet_user_path( user )
    else
      link_to label, edit_timesheet_user_path( user, :start_date => start_date + shift, :end_date => end_date + shift )
    end
  end

end