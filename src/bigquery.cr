require "./bigquery/auth/*"
require "./bigquery/includes/*"
require "./bigquery/*"

module Google
  module Bigquery
    Log          = ::Log.for("google-bigquery")
    URI_ENDPOINT = URI.parse("https://bigquery.googleapis.com")

    class Exception < ::Exception
      property http_status : HTTP::Status
      property http_body : String

      def initialize(@http_status, @http_body, @message = nil)
      end

      def self.raise_on_failure(response)
        unless response.success?
          raise new(response.status, response.body, "#{response.status.description}\n#{response.body}")
        end
      end
    end
  end
end
