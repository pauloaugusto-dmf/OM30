class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update]

  # GET /citizens or /citizens.json
  def index
    @q = Citizen.ransack(params[:q])
    @citizens = @q.result.includes(:address).page(params[:page])
    Rails.logger.info 'Index view accessed'
  end

  # GET /citizens/1 or /citizens/1.json
  def show
    Rails.logger.info "Show view of citizen ##{params[:id]} accessed"
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
    Rails.logger.info 'New view accessed'
  end

  # GET /citizens/1/edit
  def edit; end

  # POST /citizens or /citizens.json
  def create
    result = Citizens::Create.call(citizen_params)

    if result.success?
      redirect_to citizens_url, notice: t('citizen.notice.citizen_was_successfully_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    result = Citizens::Update.call(@citizen, citizen_params)

    if result.success?
      redirect_to citizens_url, notice: t('citizen.notice.citizen_was_successfully_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def citizen_params
    params.require(:citizen).permit(:status, :first_name, :last_name, :cpf, :cns, :email, :date_of_birth, :telephone,
                                    :photo, address_attributes: [:city, :complement, :fu, :ibge_code, :neighborhood,
                                                                 :public_place, :zipcode, :id])
  end
end
