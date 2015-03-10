module Ruboty
  module Brains
    class GoogleSpreadsheet < Base
      env :GOOGLE_CLIENT_ID, "Client ID"
      env :GOOGLE_CLIENT_SECRET, "Client secret"
      env :GOOGLE_REDIRECT_URI, "Redirect URI"
      env :GOOGLE_REFRESH_TOKEN, "Refresh token issued with access token"
      env :GOOGLE_SPREADSHEET_KEY, "Spreadsheet key (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)"

      def initialize
        super

        @threads = []
        @threads << Thread.new { sync }
        @threads << Thread.new { reauthenticate }
        @threads.each { |thread| thread.abort_on_exception = true }

        @client = Ruboty::GoogleSpreadsheet::Client.new(
          client_id: ENV["GOOGLE_CLIENT_ID"],
          client_secret: ENV["GOOGLE_CLIENT_SECRET"],
          redirect_uri: ENV["GOOGLE_REDIRECT_URI"],
          refresh_token: ENV["GOOGLE_REFRESH_TOKEN"]
        )
        @client.authenticate!
      end

      def data
        @data ||= Ruboty::GoogleSpreadsheet::Spreadsheet.new(
          access_token: @client.access_token,
          spreadsheet_key: ENV["GOOGLE_SPREADSHEET_KEY"]
        )
      end

      private

      def sync
        loop do
          sleep 5
          data.synchronize
        end
      end

      def reauthenticate
        loop do
          sleep 1800
          @client.authenticate!
          @data = nil
        end
      end
    end
  end
end
