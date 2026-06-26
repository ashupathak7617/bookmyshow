Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://bookmyshow-frontend-h2z6.onrender.com",
            "http://localhost:5173"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      credentials: true
  end
end
