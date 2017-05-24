class PillsController < ApplicationController
  before_action :set_pill, only: [:show, :update, :destroy, :take_pill]

  # GET /pills
  def index
    @pills = current_user.pills.all
    json_response(@pills)
  end

  # POST /pills
  def create
    # pill_params.reminder = Chronic.parse(pill_params.reminder)
  # if pill_params.trackers
  #   pill_params.trackers.map.with_index do |mail, index|
  #     u = User.find_by(email: mail)
  #     pill_params.trackers[index] = u
  #   end
  # end
  # if pill_params.remind_trackers
  #   pill_params.remind_trackers = Chronic.parse(pill_params.reminder)
  # end
      @pill = current_user.pills.new(pill_params)
    if @pill.save
      # Alert.create(@pill)
      json_response(@pill, :created)
    else
      @pill = current_user.pills.create!(pill_params)
    end
  end

  # GET /pills/:id
  def show
    json_response(@pill)
  end

  # PUT /pills/:id
  def update
    @pill.update(pill_params)
    head :no_content
  end

  # DELETE /pills/:id
  def destroy
    @pill.destroy
    head :no_content
  end

  #PUT /pills/:id/taken
  def take_pill
    @pill.time_taken = Time.now.utc.in_time_zone("Taipei")
    json_response(@pill, :taken)
  end

  private

  def pill_params
    params.require(:pill).permit(:name, :reminder, :trackers, :remind_trackers, :time_taken, :user_id)
  end

  def set_pill
    @pill = Pill.find(params[:id])
  end
end
