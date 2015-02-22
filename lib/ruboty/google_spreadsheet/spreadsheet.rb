require "google_drive"

module Ruboty
  module GoogleSpreadsheet
    class Spreadsheet
      def initialize(access_token, key)
        @access_token = access_token
        @key = key
        @worksheets = []
      end

      def [](index)
        @worksheets[index] ||= session.spreadsheet_by_key(@key).worksheets[index]
      end

      def save
        @worksheets.compact.each(&:save)
      end

      private

      def session
        @session ||= GoogleDrive.login_with_oauth(@access_token)
      end
    end
  end
end