Rails.application.routes.draw do
  # resources cria o get, post, put, delete

  get "up" => "rails/health#show", as: :rails_health_check
end
