module Api
  module V1
    class CommentsController < ApplicationController

      def index
        entry = Entry.find(params[:entry_id])
        comments = entry.comments.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded comments', data: comments}, status: :ok
      end

      def show
        entry = Entry.find(params[:entry_id])
        comment = entry.comments.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded entry', data: comment}, status: :ok
      end

      def create
        entry = Entry.find(params[:entry_id])
        comment = entry.comments.new(comment_params)
        if comment.save
          render json: {status: 'SUCCESS', message: 'Created comment', data: comment}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Comment not saved', data: comment.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        entry = Entry.find(params[:entry_id])
        comment = entry.comments.find(params[:id])
        comment.destroy
        render json: {status: 'SUCCESS', message: 'Deleted comment', data: comment}, status: :ok
      end

      def update
        entry = Entry.find(params[:entry_id])
        comment = entry.comments.find(params[:id])
        if comment.update_attributes(comment_params)
          render json: {status: 'SUCCESS', message: 'Updated comment', data: comment}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Comment not updated', data: comment.errors}, status: :unprocessable_entity
        end
      end

      private
      def comment_params
        params.permit(:usuario, :cuerpo)
      end

    end
  end
end
