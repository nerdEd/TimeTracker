# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TimeTracker2_session',
  :secret      => 'f14d136d78f0e8eb5e712a5c1fa20671e4321b9f139c0344cd9fc03a6ba2a596ae8219efc9afcba58f846ed2eb688fa50c731c3d83e47782dc2801c483b2d03d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
