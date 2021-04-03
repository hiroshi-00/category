class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy ]

  # GET /users or /users.json
  def index
    if  params[:prefecture_ids]
      params[:prefecture_ids].delete_at(0)
      search_prefecture(params[:prefecture_ids])
    else
      @users = User.all
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @prefectures = @user.user_prefectures
  end

  # GET /users/new
  def new
    @user = User.new
    @prefecture = @user.user_prefectures.build
    @prefectures = Prefecture.all
   
  end

  # GET /users/1/edit
  def edit
    @prefectures = Prefecture.all
  end

  # POST /users or /users.json
  def create
    
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, prefecture_ids: [], user_prefectures_attributes: [:id, :user_id, :birthplace_id, :current_location_id])
    end
    
    def search_prefecture(prefectures)
        selected_prefecture = []
        UserPrefecture.where(prefecture_id: prefectures).each do |user_prefecture|
          selected_prefecture << user_prefecture.user_id
        end
        @users = User.where(id: selected_prefecture.uniq)
    end
    
end
