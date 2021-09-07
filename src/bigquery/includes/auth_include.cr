module Google
  module Cloud
    module Bigquery
      module Includes
        module AuthInclude
          def get_token(credentials : (Google::Cloud::Bigquery::Auth | Google::Cloud::Bigquery::FileAuth | String)?) : String
            case credentials
            in Google::Cloud::Bigquery::Auth, Google::Cloud::Bigquery::FileAuth
              credentials.get_token.access_token
            in String
              credentials
            in Nil
              raise "Credentials are invalid"
            end
          end
        end
      end
    end
  end
end
