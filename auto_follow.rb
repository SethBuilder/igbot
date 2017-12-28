require 'watir'
require_relative 'credentials'
require 'Pry'
require 'rb-readline'
require 'awesome_print'
# Selenium::WebDriver::Chrome.driver_path = 'C:\Users\bnbih\Downloads\chromedriver_win32\chromedriver.exe' 
Selenium::WebDriver::Firefox.driver_path = 'C:\Users\bnbih\Desktop\ig_bot\geckodriver.exe' 

#read my ig username and password
username = $username
password = $password

#Follow the followers of these instagrammers
users = ['showaroundcom']
# users_followers = []

# Open Browser (firefox), Navigate to Login
browser = Watir::Browser.new :firefox
browser.goto 'instagram.com/accounts/login/'

# Navigate to Username and Password fields, inject info
ap "Loging in ..."
browser.text_field(:name => 'username').set "#{username}"
browser.text_field(:name => 'password').set "#{password}"

# Click Login Button
browser.button(:class => ['_qv64e _gexxb _4tgw8 _njrw0']).click
sleep(2)

#Go through instagrammers that I want to follow their followers
users.each { |val|

	# Go to the account page
	browser.goto "instagram.com/#{val}/"
	ap "Fetching users for #{val}"

	# Click on the user's list of followers
	browser.link(:class => ['_t98z6']).click
	sleep(2)


	#scroll down a bit to make more followers visible to the bot
	for i in 0..2
	   	browser.driver.execute_script("document.querySelector('._gs38e').scrollTop=10000;")
		sleep(2)
		browser.driver.execute_script("document.querySelector('._gs38e').scrollTop=0;")
	end
	
	#Collect the "Follow" buttons
	browser.buttons(:class => ["_qv64e _gexxb _4tgw8 _njrw0"]).each do |b|

		#Click them!
		b.click

		#Sleep so not to appear like a bot. TO DO: make rand value
		sleep(5)
	end

	# for i in 0..5
	#    	browser.driver.execute_script("document.querySelector('._gs38e').scrollTop=10000;")
	# 	sleep(3)
	# 	browser.driver.execute_script("document.querySelector('._gs38e').scrollTop=0;")
	# end

	# browser.buttons(:class => ["_qv64e _t78yp _4tgw8 _njrw0"]).each do |b|
	# 	b.click
	# end


}
