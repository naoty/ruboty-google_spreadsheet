require "google/api_client"

module Ruboty
  module GoogleSpreadsheet
    class Client
      SCOPE = "https://www.googleapis.com/auth/drive"

      def initialize(attrs = {})
        @authorization = api_client.authorization
        @authorization.client_id = attrs[:client_id]
        @authorization.client_secret = attrs[:client_secret]
        @authorization.scope = SCOPE
        @authorization.redirect_uri = attrs[:redirect_uri]
        @authorization.refresh_token = attrs[:refresh_token]
      end

      def authenticate!
        @authorization.fetch_access_token!
      end

      def access_token
        @authorization.access_token
      end

      private

      def api_client
        @api_client ||= Google::APIClient.new(
          application_name: "ruboty-google_spreadsheet",
          application_version: VERSION
        )
      end
    end
  end
end
