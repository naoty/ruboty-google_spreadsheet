module Ruboty
  module Brains
    class GoogleSpreadsheet < Base
      env :GOOGLE_API_ACCESS_TOKEN, "Access token for Google API"
      env :GOOGLE_SPREADSHEET_KEY, "Spreadsheet key (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)"

      def initialize
        super
        @thread = Thread.new { sync }
        @thread.abort_on_exception = true
      end

      def data
        @data ||= Ruboty::GoogleSpreadsheet::Spreadsheet.new(
          ENV["GOOGLE_API_ACCESS_TOKEN"],
          ENV["GOOGLE_SPREADSHEET_KEY"]
        )
      end

      private

      def sync
        loop do
          wait
          data.synchronize
        end
      end

      def wait
        sleep(interval)
      end

      def interval
        (ENV["GOOGLE_SPREADSHEET_SAVE_INTERVAL"] || 5).to_i
      end
    end
  end
end
