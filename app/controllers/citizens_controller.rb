class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update]

  # GET /citizens or /citizens.json
  def index
    @citizens = Citizen.all
  end

  # GET /citizens/1 or /citizens/1.json
  def show; end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  # GET /citizens/1/edit
  def edit; end

  # POST /citizens or /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        format.html { redirect_to citizen_url(@citizen), notice: t('citizen.notice.citizen_was_successfully_created') }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to citizen_url(@citizen), notice: t('citizen.notice.citizen_was_successfully_updated') }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
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
                                    photo: [], address_attributes: [:city, :complement, :fu, :ibge_code, :neighborhood,
                                                                    :public_place, :zipcode, :id])
  end
end
