### REQUIRED GEMS ###
require 'pry'
require 'nokogiri'
require 'open-uri'

### REQUIRED FILES ###
require_relative './rain_jackets/version'
require_relative './rain_jackets/cli'


### NAMESPACE MODULE ###
module RainJackets
  class Error < StandardError; end
  # Your code goes here...
end
