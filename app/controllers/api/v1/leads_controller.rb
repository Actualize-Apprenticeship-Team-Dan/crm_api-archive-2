class Api::V1::LeadsController < ApplicationController

  require 'will_paginate/array'

  def index
    p "-"*50
    p params["before"]
    p params["actual"]
    p params["leadFilter"]

    filter = params[:filter] || ""
    filter.downcase!
    sort = params[:sort] || 'created_at'
    direction = params[:direction] || "true"
    direction = direction == "true" ? 'ASC' : 'DESC' 

    if params[:filter] != nil && params[:filter] != "" 
      
      @leads = Lead.includes(:outreaches, :events).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(email) LIKE ?","%#{filter}%","%#{filter}%","%#{filter}%").limit(100)
    else
      @leads = Lead.includes(:outreaches, :events).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(email) LIKE ?","%#{filter}%","%#{filter}%","%#{filter}%").order("#{sort} #{direction}").limit(params["actual"]).offset(params["before"])
    end

    render "index.json.jbuilder"
  end

  def show
    @lead = Lead.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    # A lead is created by someone triggering an "event" on the website in 
    # which they submit information like a name and email address. 
    # If this is the first time this particular person triggered an event,
    # they become a lead, so we store both the lead and the particular
    # event they triggered. If they've triggered an event previously and already
    # become a lead in the past, we just record their new event.
    
    @lead = Lead.find_or_create_by(email: params[:email]) do |lead|
      lead.first_name = params[:first_name]
      lead.last_name = params[:last_name]
      lead.phone = params[:phone]
      lead.ip = params[:ip]
      lead.city = params[:city]
      lead.state = params[:state]
      lead.zip = params[:zip]
      lead.created_at = params[:created_at]
      lead.updated_at = params[:updated_at]
    end
    @lead.events.create(name: params[:name], created_at: params[:created_at], updated_at: params[:updated_at])
    render "show.json.jbuilder"
  end



end
