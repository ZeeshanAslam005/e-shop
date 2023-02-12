# Api to disburse orders of merchants

module Api
  module V1
    class DisbursementsController < ApplicationController
      def index
        if permit_params[:merchant].blank?
          render json: Disbursement.all.to_json
        else
          render json: Disbursement.for_merchant(permit_params[:merchant], permit_params[:start_date],
                                                 permit_params[:end_date]).to_json
        end
      end

      private

      def permit_params
        params
          .permit(:merchant, :start_date, :end_date)
          .with_defaults(start_date: Time.zone.now.beginning_of_week, end_date: Time.zone.now.end_of_week)
      end
    end
  end
end
