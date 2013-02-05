class MeasurementsController < ApplicationController

  before_filter :require_login
  load_and_authorize_resource

  # GET /measurements
  # GET /measurements.json
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /measurements/new
  # GET /measurements/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create

    #set default values
    @measurement.user_id = current_user.id
    @measurement.day_id = Day.where(:date => Date.today).first.id

    #TODO: move this to measurement.rb
    case @measurement.direction
    when 'up'
      @measurement.extended_value = @measurement.number_of_flights.to_d * current_user.contest.ascend_value.to_d
    when 'down'
      @measurement.extended_value = @measurement.number_of_flights.to_d * current_user.contest.descend_value.to_d
    end

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to contestant_path(@measurement.user), notice: 'Your flights have been added.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /measurements/1
  # PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    user = @measurement.user
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to contestant_path(user), notice: 'Your flights have been deleted.' }
    end
  end
end
