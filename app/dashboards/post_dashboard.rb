require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    date: Field::Date,
    rationale: Field::Text,
    status: Field::Text,
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  #
  COLLECTION_ATTRIBUTES = %i[
    id
    date
    status
    rationale
    user
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    date
    rationale
    user
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    date
    rationale
    user
    status
  ].freeze
  COLLECTION_FILTERS = {}.freeze

  #
end
