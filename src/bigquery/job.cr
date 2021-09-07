require "./includes/*"

module Google
  module Cloud
    module Bigquery
      class Job
        include Google::Cloud::Bigquery::Includes::AuthInclude

        property service : Bigquery::Service

        def initialize(@service)
        end
      end
    end
  end
end
