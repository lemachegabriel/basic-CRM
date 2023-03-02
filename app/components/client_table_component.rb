# frozen_string_literal: true

class ClientTableComponent < ViewComponent::Base
  def initialize(prospects:, table_fields:, current_page:, total_pages:)
    @prospects = prospects
    @table_fields = table_fields
    @current_page = current_page
    @total_pages = total_pages
  end
end
