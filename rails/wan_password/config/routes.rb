Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  mount WorkshopApi::ApiBase => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
