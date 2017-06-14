module Api
  module V1
    class ProportionsController < ApplicationController
      def index
        render json: Proportion.all
      end

      def show
        render json: Proportion.find(params[:id])
      end

      def create
        proportion = Proportion.create(proportion_params)
        render json: proportion
      end

      def edit

      end

      def update
        proportion = Proportion.find(params[:id])
        proportion.update(proportion_params)
        render json: proportion
      end

      def destroy
        proportion = Proportion.find(params[:id])
        proportion.destroy
        render json: proportion
      end

      private

      def proportion_params
        params.require(:proportion).permit(:amount, :cocktail, :ingredient)
      end
    end
  end
end
