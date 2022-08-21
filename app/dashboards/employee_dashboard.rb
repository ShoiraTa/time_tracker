require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    posts: Field::HasMany,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone_number: Field::String,
    ssn: Field::Number,
    company: Field::String,
  }.freeze
  
  COLLECTION_ATTRIBUTES = %i[
    id
    email
    posts
    type
    phone_number
    first_name
    ssn
  ].freeze
  SHOW_PAGE_ATTRIBUTES = %i[
    ssn
    company
    email
    password
    first_name
    last_name
    phone_number
    posts
    remember_created_at
    reset_password_sent_at
    reset_password_token
    type
    created_at
    updated_at
  ].freeze
  FORM_ATTRIBUTES = %i[
    ssn
    company
    email
    password
    first_name
    last_name
    phone_number
    type
  ].freeze
  
  
  COLLECTION_FILTERS = {}.freeze
  
end
