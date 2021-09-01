require "json"
require "spec"
require "webmock"
require "../src/bigquery"

Spec.before_each &->WebMock.reset
