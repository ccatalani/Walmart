# encoding: UTF-8
# virtual_store.rb

module VirtualStore

  class Walmart

    # initialize(browser)
    def initialize(browser)
      puts "Going to Walmart's virtual store"
      @browser = browser
      @browser.goto ENV['WALMART']
      puts "URL OPENING: "+ENV['WALMART']
    end

    # method to execute a product search
    def product_search(characs_hash)
      puts "Searching for a product in the Walmart's virtual store"
      sleep 15
      @browser.text_field(:id, "suggestion-search").set("#{characs_hash['product_name']}")
      sleep 15
      @browser.button(:value,"Procurar").click

      sleep 15

      if @browser.span(:class, "result-items").exists?
        @products_quantity = @browser.span(:class, "result-items").text
        @products_quantity = @products_quantity.split(" ").first
      else
        @products_quantity = nil
        @message = @browser.div(:class, "message").text
      end
    end

    # method to click on the first product in the results
    def product_details()
      sleep 15
      puts "Opening the page of the choosen product"
      @browser.li(:class, "item-0").click
    end

    # method that check if the product page was properly loaded
    def page_load()
      sleep 10
      puts "Checking if the page of the product was properly loaded"
      if @browser.button(:class, "btn-success").exists?
        puts "The page of this product was properly loaded!"
        return true
      else
        puts "The page of this product was unproperly loaded!"
        return false
      end
    end

    # method to add the product to cart
    def add_product_cart()
      sleep 10
      puts "Adding the choosen product to cart"
      @browser.button(:class, "buy-button btn btn-success").click
      sleep 10
      if @browser.button(:id, "navegaCarrinho").exists?
        @browser.button(:id, "navegaCarrinho").click
      end
    end

    # method that verifies if the product was added to cart
    def product_added_cart()
      sleep 10
      @browser.link(:text, "1").click

      sleep 10

      # Check if it has items in the cart
      if @browser.li(:class, "number").exists?
        puts "Product added with success!"
        # Check the product name and the quantity added to cart
        product_name = @browser.link(:class, "link-description").text
        products_quantity = @browser.text_field(:class, "quantity-spinner").text
        puts "PRODUCT NAME: "+product_name
        puts "QUANTITY: "+products_quantity
        @product_info = Hash['product_name' => product_name, 'products_quantity' => products_quantity]
        return true
      else
        puts "The product was not added to cart."
        return false
      end

    end

    # quantity of returned products
    def products_quantity()
      puts "Checking if the search has returned results."
      puts "PRODUCTS QUANTITY: "
      puts @products_quantity
      @products_quantity
    end

    # Check what product was added to cart
    def product()
      puts @product_info
      @product_info
    end

    # Check returned message
    def message()
      puts "MESSAGE: "
      puts @message
      @message
    end

  end
end