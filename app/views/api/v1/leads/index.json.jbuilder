json.array!  @leads.each do |lead|
  json.(lead, :id, :first_name, :last_name, :email, :phone, :ip, :city, :state,
  :zip, :contacted, :appointment_date, :created_at, :updated_at, :notes, :outreaches, :events, :most_recent_event)
end