class TalksController < ApplicationController

  before_filter :require_login
  load_and_authorize_resource  

  # GET /talks
  # GET /talks.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talks }
    end
  end

  # GET /talks/1
  # GET /talks/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @talk }
    end
  end

  # GET /talks/new
  # GET /talks/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @talk }
    end
  end

  # GET /talks/1/edit
  def edit
  end

  # POST /talks
  # POST /talks.json
  def create

    @talk.contestant_id = current_user.id

    respond_to do |format|
      if @talk.save
        format.html { redirect_to @talk, notice: 'Talk was successfully created.' }
        format.json { render json: @talk, status: :created, location: @talk }
      else
        format.html { render action: "new" }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /talks/1
  # PUT /talks/1.json
  def update

    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        format.html { redirect_to @talk, notice: 'Talk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to talks_url }
      format.json { head :no_content }
    end
  end
end
