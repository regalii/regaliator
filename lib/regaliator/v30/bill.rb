require 'regaliator/endpoint'

module Regaliator
  module V30
    class Bill < Endpoint
      def create(params = {})
        request('/bills', params).post
      end

      def show(id)
        request("/bills/#{id}").get
      end

      def update(id, params = {})
        request("/bills/#{id}", params).patch
      end

      def refresh(id)
        request("/bills/#{id}/refresh").post
      end

      def pay(id, params = {})
        request("/bills/#{id}/pay", params).post
      end

      def xdata(id)
        request("/bills/#{id}/xdata").get
      end

      def list(params = {})
        request('/bills', params).get
      end
    end
  end
end
