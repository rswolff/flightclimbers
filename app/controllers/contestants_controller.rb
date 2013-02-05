class ContestantsController < ApplicationController
  
  before_filter :require_login, :except => [:new, :create]
  load_and_authorize_resource 

  # GET /contestants
  # GET /contestants.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contestants }
    end
  end

  # GET /contestants/1
  # GET /contestants/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contestant }
    end
  end

  # GET /contestants/new
  # GET /contestants/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contestant }
    end
  end

  # GET /contestants/1/edit
  def edit
  end

  # POST /contestants
  # POST /contestants.json
  def create

    respond_to do |format|
      if @contestant.save
        format.html { redirect_to @contestant, notice: 'Contestant was successfully created.' }
        format.json { render json: @contestant, status: :created, location: @contestant }
      else
        format.html { render action: "new" }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contestants/1
  # PUT /contestants/1.json
  def update
    respond_to do |format|
      if @contestant.update_attributes(params[:contestant])
        format.html { redirect_to @contestant, notice: 'Contestant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestants/1
  # DELETE /contestants/1.json
  def destroy
    @contestant.destroy

    respond_to do |format|
      format.html { redirect_to contestants_url }
      format.json { head :no_content }
    end
  end
end
