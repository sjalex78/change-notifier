# frozen_string_literal: true

# NOTE: helper for testing the landing page
module Pages
  class Landing < SitePrism::Page
    set_url Rails.application.routes.url_helpers.root_path

    element :title, "[data-testid=page-title]"
  end
end
