require "./includes/*"

module Google
  module Bigquery
    class Table
      include Google::Bigquery::Includes::AuthInclude

      def initialize(
        @auth : Google::Bigquery::Auth | Google::Bigquery::FileAuth | String,
        @project_id : String,
        @dataset : String
      )
      end

      def list
        response = ConnectProxy::HTTPClient.new(Google::Bigquery::URI_ENDPOINT) do |client|
          client.exec("GET", "/bigquery/v2/projects/#{@project_id}/datasets/#{@dataset}/tables", HTTP::Headers{
            "Authorization" => "Bearer #{get_token(@auth)}",
          })
        end

        JSON.parse(response.body)
      end
    end
  end
end
