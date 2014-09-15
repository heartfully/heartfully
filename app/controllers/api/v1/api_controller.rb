module Api
  module V1
    class ApiController < ApplicationController

      # def default_serializer_options
      #   {root: false}
      # end

      protected

      def render_success(resource)
        render :json => resource, :status => 200
      end

      def render_created(resource)
        render :json => resource, :status => 201
      end

      def render_destroyed
        render :status => 200
      end

      def render_error(error)
        render :json => { :errors => [error] }, :status => 406
      end

      def render_resource_errors(resource)
        render :json => { :errors => resource.errors.full_messages }, :status => 406
      end

      def render_non_existent
        render :json => { :errors => ["Record not found"] }, :status => 404
      end

    end
  end
end