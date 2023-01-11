module Google
  module Cloud
    module Bigquery
      class Tabledata
        include Google::Cloud::Bigquery::Includes::AuthInclude

        def initialize(
          @auth : Google::Cloud::Bigquery::Auth | Google::Cloud::Bigquery::FileAuth | String,
          @project_id : String,
          @dataset : String,
          @table_id : String,
        )
        end

        # https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata/insertAll
        def insert_all(rows : Array(NamedTuple(insertId: String, json: String)))
          response = ConnectProxy::HTTPClient.new(Google::Cloud::Bigquery::URI_ENDPOINT) do |client|
            client.exec("POST", "/bigquery/v2/projects/#{@project_id}/datasets/#{@dataset}/tables/#{@table_id}/insertAll", HTTP::Headers{
              "Authorization" => "Bearer #{get_token(@auth)}",
            }, {rows: rows}.to_json)
          end

          JSON.parse(response.body)
        end

        # https://cloud.google.com/bigquery/docs/reference/rest/v2/tabledata/list
        def list(params : HTTP::Params? = nil)
          response = ConnectProxy::HTTPClient.new(Google::Cloud::Bigquery::URI_ENDPOINT) do |client|
            path = "/bigquery/v2/projects/#{@project_id}/datasets/#{@dataset}/tables/#{@table_id}/data"
            path = path + "?#{params}" if params
            client.exec("GET", path, HTTP::Headers{
              "Authorization" => "Bearer #{get_token(@auth)}",
            })
          end

          JSON.parse(response.body)
        end
      end
    end
  end
end
