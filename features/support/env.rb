# encoding: UTF-8
require 'active_support'
require 'active_support/builder'
require 'active_support/core_ext'
require 'watir-webdriver'

# LOAD ALL THE FILES FROM COMMON FOLDER
Dir[File.dirname(__FILE__) + '/../../common/*.rb'].each { |file| require file }

# LOAD ALL THE FILES FROM BUSINESS FOLDER
Dir[File.dirname(__FILE__) + '/../../business/*.rb'].each { |file| require file }

#####################################
#####     HOST VIRTUAL STORE   ######
#####################################
ENV['WALMART'] = 'https://www.walmart.com.br/'

