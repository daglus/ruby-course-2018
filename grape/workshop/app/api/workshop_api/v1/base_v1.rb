module WorkshopApi
  module V1
    class BaseV1 < WorkshopApi::ApiBase
      extend ActionView::Helpers::TranslationHelper
      prefix 'api'
      version 'v1', using: :accept_version_header

      mount WorkshopApi::V1::FakeEndpoints
      add_swagger_documentation api_version: 'v1', hide_documentation_path: true
    end
  end
end
