# frozen_string_literal: true
require 'axe-selenium'
require 'yaml'
require 'active_support/inflector'
require 'selenium-webdriver'

module DriverHelper
  def driver(browser = :chrome, js_path = nil, skip_iframes = nil)
    @driver ||= create_driver(browser, js_path, skip_iframes)
  end

  private

  def create_driver(browser, js_path, skip_iframes)
    AxeSelenium.configure(browser) do |config|
      config.jslib_path = js_path if js_path
      config.skip_iframes = skip_iframes if skip_iframes
    end.page
  end
end
