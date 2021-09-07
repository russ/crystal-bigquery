require "./bigquery/auth/*"
require "./bigquery/includes/*"
require "./bigquery/service"
require "./bigquery/dataset"
require "./bigquery/job"
require "./bigquery/project"
require "./bigquery/query_job"
require "./bigquery/table"

module Google
  module Cloud
    module Bigquery
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

      def self.new(
        project_id : String? = nil,
        credentials : (Google::Cloud::Bigquery::Auth | Google::Cloud::Bigquery::FileAuth | String)? = nil,
        scope : String = "https://www.googleapis.com/auth/bigquery",
        retries : Int32 = 5,
        timeout : Int32 = 10,
        endpoint : String = "https://bigquery.googleapis.com"
      )
        Bigquery::Project.new(
          Bigquery::Service.new(
            project_id: project_id,
            credentials: credentials,
            scope: scope,
            retries: retries,
            timeout: timeout,
            endpoint: endpoint,
          )
        )
      end
    end
  end
end

# # Set the default bigquery configuration
# Google::Cloud.configure.add_config! :bigquery do |config|
#   default_project = Google::Cloud::Config.deferred do
#     ENV["BIGQUERY_PROJECT"]
#   end
#   default_creds = Google::Cloud::Config.deferred do
#     Google::Cloud::Config.credentials_from_env(
#       "BIGQUERY_CREDENTIALS", "BIGQUERY_CREDENTIALS_JSON", "BIGQUERY_KEYFILE", "BIGQUERY_KEYFILE_JSON"
#     )
#   end
#
#   config.add_field! :project_id, default_project, match: String, allow_nil: true
#   config.add_alias! :project, :project_id
#   config.add_field! :credentials, default_creds, match: [String, Hash, Google::Auth::Credentials], allow_nil: true
#   config.add_alias! :keyfile, :credentials
#   config.add_field! :scope, nil, match: [String, Array]
#   config.add_field! :quota_project, nil, match: String
#   config.add_field! :retries, nil, match: Integer
#   config.add_field! :timeout, nil, match: Integer
#   config.add_field! :endpoint, nil, match: String
# end
