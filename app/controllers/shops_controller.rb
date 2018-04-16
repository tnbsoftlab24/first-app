class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]

      def index
          @shops = Shop.all
      end

      def new
         @shop = Shop.new
      end


      def show
      end

      def edit
      end

      def create
          @shop = Shop.new(shop_params)
          @shop.user = current_user

          respond_to do |format|
            if @shop.save
              format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
              format.json { render :show, status: :created, location: @shop }
            else
              format.html { render :new }
              format.json { render json: @shop.errors, status: :unprocessable_entity }
            end
          end
      end

      def update
          respond_to do |format|
            if @shop.update(shop_params)
              format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
              format.json { render :show, status: :ok, location: @shop }
            else
              format.html { render :edit }
              format.json { render json: @shop.errors, status: :unprocessable_entity }
            end
          end
      end

      def destroy
          @shop.destroy
          respond_to do |format|
            format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
            format.json { head :no_content }
          end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_shop
        @shop = Shop.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def shop_params
        params.require(:shop).permit(:name, :description)
      end

  end
