module Api
  module V1
    class LineFoodsController < ApplicationController
      # --- この行を修正 ---
      before_action :set_food, only: %i[create replace]

      def index
        # 省略
      end

      def create
        # 省略
      end

      def replace
        LineFood.active.other_restaurant(@ordered_food.restaurant.id).each do |line_food|
          line_food.update_attribute(:active, false)
        end

        set_line_food(@ordered_food)

        if @line_food.save
          render json: {
            line_food: @line_food
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      private
      #省略

    end
  end
end
