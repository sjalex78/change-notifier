# frozen_string_literal: true

module Pages
  class ItWorks < SitePrism::Page
    set_url Rails.application.routes.url_helpers.test_root_rails_path

    element :rails_version, "ul li", text: "Rails version"
    element :ruby_version, "ul li", text: "Ruby version"
  end
end
