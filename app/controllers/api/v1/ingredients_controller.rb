module Api
  module V1
    class IngredientsController < ApplicationController
      def index
        render json: Ingredient.all
      end

      def show
        render json: Ingredient.find(params[:id])
      end

      def create
        ingredient = Ingredient.create(ingredient_params)
        render json: ingredient
      end

      def edit

      end

      def update
        ingredient = Ingredient.find(params[:id])
        ingredient.update(ingredient_params)
        render json: ingredient
      end

      def destroy
        ingredient = Ingredient.find(params[:id])
        ingredient.destroy
        render json: ingredient
      end

      private

      def ingredient_params
        params.require(:ingredient).permit(:name)
      end
    end
  end
end
