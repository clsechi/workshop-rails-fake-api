Rails.application.routes.draw do
  mount FakeApi::Engine => '/api', format: :json
end
