# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_marketplace_session',
  :secret      => '8e0220fbfc8ba03202a26c9bc9013fa2a1bd18e3fa9adbc34e9ee3622bdf98b9fa6cf1d4a37d30b3b13d5ef6ff5828d51985c2a0ef37673786c8511fdc463919'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
