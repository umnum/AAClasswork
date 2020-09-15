class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, only: [:new, :edit, :destroy]

  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
    @post
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit

    # sub = current_user.subs_moderated.find_by(id: params[:id])
    if @sub.moderator_id == current_user.id
      render :edit
    else
      redirect_to subs_url
    end
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = Sub.new(sub_params)

    respond_to do |format|
      if @sub.save
        format.html { redirect_to @sub, notice: 'Sub was successfully created.' }
        format.json { render :show, status: :created, location: @sub }
      else
        format.html { render :new }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
    respond_to do |format|
      if @sub.update(sub_params)
        format.html { redirect_to @sub, notice: 'Sub was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub }
      else
        format.html { render :edit }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  def destroy
    if @sub.moderator_id == current_user.id
        @sub.destroy
        respond_to do |format|
        format.html { redirect_to subs_url, notice: 'Sub was successfully destroyed.' }
        format.json { head :no_content }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
