class ContestantDaysController < ApplicationController
	before_filter :require_login
  load_and_authorize_resource 
	
	def show
	  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
	end

	def edit
		respond_to do |format|
      if @contestant_day.update_attributes(params[:contestant_day])
        format.html { redirect_to @contestant_day, notice: 'Contestant Day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contestant_day.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
	end
end