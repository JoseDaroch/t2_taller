module Api
  module V1
    class EntriesController < ApplicationController

      def index
        entries = Entry.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded entries', data: entries}, status: :ok
      end

      def show
        entry = Entry.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded entry', data: entry}, status: :ok

      end

      def create
        entry = Entry.new(entry_params)
        if entry.save
          render json: {status: 'SUCCESS', message: 'Created entry', data: entry}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Entrie not saved', data: entry.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        entry = Entry.find(params[:id])
        entry.destroy
        render json: {status: 'SUCCESS', message: 'Deleted entry', data: entry}, status: :ok
      end

      def update
        entry = Entry.find(params[:id])
        if entry.update_attributes(entry_params)
          render json: {status: 'SUCCESS', message: 'Updated entry', data: entry}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Entry not updated', data: entry.errors}, status: :unprocessable_entity
        end
      end


      private
      def entry_params
        params.permit(:titulo, :bajada, :cuerpo)
      end

    end
  end
end
