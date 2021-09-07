module Google
  module Cloud
    module Bigquery
      class QueryJob < Job
        def query(query : String)
          response = ConnectProxy::HTTPClient.new(Google::Cloud::Bigquery::URI_ENDPOINT) do |client|
            client.exec("POST", "/bigquery/v2/projects/#{service.project_id}/queries", HTTP::Headers{
              "Authorization" => "Bearer #{get_token(service.credentials)}",
            }, {query: query}.to_json)
          end

          JSON.parse(response.body)
        end
      end
    end
  end
end
