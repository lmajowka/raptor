Raptor::Application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true

  unless Rails.env.production?
    ENV['HTTP_USER'] = 'testuser'
    ENV['HTTP_PASS'] = 'testpass'
  end
end
