module Google
  module Cloud
    module Bigquery
      class Project
        getter service : Bigquery::Service

        def initialize(@service)
        end

        def datasets(all : Bool = false, filter : String? = nil, max : Int32 = nil, token : String = nil)
          # execute(backoff: true) do
          #   service.list_datasets @project, all: all, filter: filter, max_results: max, page_token: token
          # end
        end

        def query_job(query : String)
          QueryJob.new(@service).query(query)
        end
      end
    end
  end
end
