if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_tiki_taylor', domain: 'taylorstiki25th.rsvp'
else
  Rails.application.config.session_store :cookie_store, key: '_tiki_taylor' 
end