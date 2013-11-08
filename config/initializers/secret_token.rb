# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Scheduler::Application.config.secret_key_base = '90616c27d0f8d5adea7605d412df0a745dc0ad7af4c9f2851a334c7d6a34f86964b37ec0409e981cc9c2a092b30e013e08d7d4628452f01bee17601b5c4079aa'
