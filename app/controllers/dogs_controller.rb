class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  # GET /dogs
  def index
    @search = Dog.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @dogs = @search.result.page(params[:page])
  end

  # GET /dogs/1
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      @dog.broadcast_prepend_to("dogs")
      flash.now.notice = "いぬを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      @dog.broadcast_replace_to("dogs")
      flash.now.notice = "いぬを更新しました。"
    else
      flash.now.alert = "いぬの更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
    @dog.broadcast_remove_to("dogs")
    flash.now.notice = "いぬを削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :age)
    end
end
