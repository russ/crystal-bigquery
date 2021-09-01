require "./includes/*"

module Google
  module Bigquery
    class Job
      include Google::Bigquery::Includes::AuthInclude

      def initialize(
        @auth : Google::Bigquery::Auth | Google::Bigquery::FileAuth | String,
        @project_id : String,
        @dataset : String
      )
      end

      def query(query : String)
        response = ConnectProxy::HTTPClient.new(Google::Bigquery::URI_ENDPOINT) do |client|
          client.exec("POST", "/bigquery/v2/projects/#{@project_id}/queries", HTTP::Headers{
            "Authorization" => "Bearer #{get_token(@auth)}",
          }, {query: query}.to_json)
        end

        response.body
      end
    end
  end
end
