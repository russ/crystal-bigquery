module Google
  module Cloud
    module Bigquery
      class Service
        # Log          = ::Log.for("google-bigquery")

        getter project_id : String?
        getter credentials : (Google::Cloud::Bigquery::Auth | Google::Cloud::Bigquery::FileAuth | String)?
        getter scope : String
        getter retries : Int32 = 5
        getter timeout : Int32 = 10
        getter endpoint : String

        def initialize(
          @project_id = nil,
          @credentials = nil,
          @scope = "https://www.googleapis.com/auth/bigquery",
          @retries = 5,
          @timeout = 10,
          @endpoint = "https://bigquery.googleapis.com"
        )
          Bigquery::Project.new(self)
        end

        # def wait_until_done!
        #   backoff = lambda do |retries|
        #     delay = [retries**2 + 5, 60].min # Maximum delay is 60
        #     sleep delay
        #   end
        #   retries = 0
        #   until done?
        #     backoff.call retries
        #     retries += 1
        #     reload!
        #   end
        # end

        def list_datasets
        end
      end
    end
  end
end
