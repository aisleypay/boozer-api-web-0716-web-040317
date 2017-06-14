module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        render json: Cocktail.find(params[:id])
      end

      def create

        name = params["cocktail"]["name"]
        description = params["cocktail"]["description"]
        instructions = params["cocktail"]["instructions"]
        source = params["cocktail"]["source"]

        cocktail = Cocktail.create(name: name, description: description, instructions:instructions, source: source)

        params["cocktail"]["proportions"].each do |proportion|
          ing = Ingredient.find_or_create_by(name: proportion["ingredient"])
          prop = Proportion.find_or_create_by(amount: proportion["amount"], cocktail: cocktail, ingredient: ing)
        end

        render json: cocktail
      end

      def edit

      end

      def update
        cocktail = Cocktail.find(params[:id])
        cocktail.update(cocktail_params)
        render json: cocktail
      end

      def destroy
        cocktail = Cocktail.find(params[:id])
        cocktail.destroy
        render json: cocktail
      end

      # private

      # def cocktail_params
      #   params.require(:cocktail).permit(:name, :description, :instructions, :source, proportion: [:amount, :ingredient])
      # end
    end
  end
end
