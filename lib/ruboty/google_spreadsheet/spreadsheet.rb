require "google_drive"

module Ruboty
  module GoogleSpreadsheet
    class Spreadsheet
      def initialize(attrs = {})
        @access_token = attrs[:access_token]
        @key = attrs[:spreadsheet_key]
        @worksheets = []
      end

      def [](index)
        @worksheets[index] ||= session.spreadsheet_by_key(@key).worksheets[index]
      end

      def synchronize
        @worksheets.compact.each(&:synchronize)
      end

      private

      def session
        @session ||= GoogleDrive.login_with_oauth(@access_token)
      end
    end
  end
end
