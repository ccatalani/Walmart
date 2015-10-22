# encoding: UTF-8

Given(/^a test case "([^"]*)"$/) do |arg1|
  @test_case = arg1
end

Given(/^I go to Walmart's virtual store$/) do
  puts "Going to Walmart's virtual store"
  @requisition = VirtualStore::Walmart.new(@browser)
end

When(/^I search for a product with the following description$/) do |table|
  puts "Searching for a product in the Walmart's store"
   table.hashes.each do |hash|
     @requisition.product_search(hash)
   end  
end

When(/^I shall check the search has returned results$/) do
   puts "Checking if the search has returned results"
  expect(@requisition.products_quantity).not_to eq(nil)
end

When(/^I go to the page of the choosen product$/) do
   puts "Opening the page of the choosen product"
  @requisition.product_details
end

When(/^I shall check the page of the choosen product was correctly loaded$/) do
  puts "Checking if the page of the product was properly loaded"
  expect(@requisition.page_load).to eq(true)
end

When(/^I add the choosen product to cart$/) do
  puts "Adding the choosen product to cart"
  @requisition.add_product_cart
end

Then(/^I shall check the choosen product "([^"]*)" was correctly added to cart$/) do |product_name|
  puts "Checking if the choosen product was correctly added to cart"
  product = @requisition.product
  expect(@requisition.product_added_cart).to eq(true)
 # expect(product[product_name]).to include(product_name)
end


Then(/^customer shall receive the message "([^"]*)"$/) do |message|
  puts "Checking the message for a product not found in the virtual store"
  expect(@requisition.message).to include(message)
end
