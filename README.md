# Google::Cloud::Bigquery

This shard allows you to use Google's [BigQuery](https://cloud.google.com/bigquery/docs/reference/libraries) API service using Crystal.

## Installation

Add this to your application's `shard.yml`:

```yml
dependencies:
  bigquery:
    github: russ/crystal-bigquery
```

## Usage

To connect to BigQuery, you'll need to authenticate.
This can be done using the `Google::Cloud::Bigquery::Auth`, or
`Google::Cloud::Bigquery::FileAuth`. For the `FileAuth`, you'll
need to generate a JSON file.

```crystal
require "crystal-bigquery/bigquery"

# TODO: Link to docs on generating this JSON file
bigquery = Google::Cloud::Bigquery.new(
  project_id: "your-project-id",
  credentials: Google::Cloud::Bigquery::FileAuth.new(
    "/path/to/your/google-cloud-auth.json",
    "https://www.googleapis.com/auth/bigquery"
  )
)

sql = <<-SQL
SELECT some_field FROM your_table LIMIT 1000;
SQL

results = bigquery.query_job(sql)
```



## Links that are helpful for me developing this
* https://github.com/PlaceOS/google (For the Auth)
* https://github.com/googleapis/google-cloud-ruby/tree/master/google-cloud-bigquery (Layout)
* https://cloud.google.com/bigquery/docs/reference/rest (API)
* https://github.com/googleapis/google-api-ruby-client/blob/master/google-api-client/generated/google/apis/bigquery_v2/service.rb#L84
* https://github.com/googleapis/google-api-ruby-client/blob/3c9671176f2d1296cd0921a25fa55c5d8709e6d5/google-apis-core/lib/google/apis/core/base_service.rb#L370
