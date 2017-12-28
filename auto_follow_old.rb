require 'watir'
require_relative 'credentials'
require 'Pry'
require 'rb-readline'
require 'awesome_print'
Selenium::WebDriver::Chrome.driver_path = 'C:\Users\bnbih\Desktop\ig_bot\chromedriver.exe' 

username = $username
password = $password
users = ['seifjo1', 'karliekloss', 'theweekend', 'kendalljenner']

# Open Browser, Navigate to Login
browser = Watir::Browser.new :chrome

browser.goto 'instagram.com/accounts/login/'

# Navigate to Username and Password fields, inject info

ap "Loging in ..."

browser.text_field(:name => 'username').set "#{username}"
browser.text_field(:name => 'password').set "#{password}"

# Click Login Button
browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(2)

while true
	users.each { |val|
		# Navigate to User Page
		browser.goto "instagram.com/#{val}/"

		#If not following, follow
		if browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').exists?
			ap "Following #{val}"
			browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').click
		#If not following, follow
		elsif browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').exists?
			puts "Unfollowing #{val}"
			browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').click
		end

	}
	puts "--------- #{Time.now} ----------"
	sleep(30)
end
Pry.star(binding)