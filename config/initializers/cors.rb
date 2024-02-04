Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://main--keen-horse-867dfe.netlify.app', 'https://keen-horse-867dfe.netlify.app', 'localhost:5173'
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  
    allow do
      origins 'https://your-applications-domain.com'
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  end
  