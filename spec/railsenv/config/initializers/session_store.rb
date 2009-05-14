# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railsenv_session',
  :secret      => '5eea0426c25c0db25fb5a2e355216ce600e4c09909abc217f25ed64311de6c1d49bd422e244d04e76dd00b020a8f8c535b10a353f0b0d697350ac22f8a487294'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
