module Google
  module Bigquery
    module Includes
      module AuthInclude
        def get_token(auth) : String
          case auth
          in Google::Bigquery::Auth, Google::Bigquery::FileAuth
            auth.get_token.access_token
          in String
            auth
          end
        end
      end
    end
  end
end
