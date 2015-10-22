# before
Before do 
  @browser = Watir::Browser.new
end

# after
After do
  @browser.close
end

# after scenario
After do |scenario|
  @browser.screenshot.save("reports/#{scenario.__id__}.png")
  embed("reports/#{scenario.__id__}.png", "image/png", "SCREENSHOT_#{scenario.__id__}")
end
