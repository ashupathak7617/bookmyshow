Rails.application.config.session_store :cookie_store,
  key: '_bookmyshow_session',
  same_site: :none,
  secure: true