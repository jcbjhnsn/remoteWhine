require 'rubygems' # It does what makes shiny!
require 'twitter' # It's what's does tweets!
require 'oauth' # It's what's does login!

# Arrays ifconfig data
def ifconfig
	# [%x[curl ifconfig.me/ip], %x[curl ifconfig.me/host],]
	[%x[curl ifconfig.me/{ip,host}]]
end

# login 

Twitter.configure do |config|
  config.consumer_key = consumer[0]
  config.consumer_secret = consumer[1]
  config.oauth_token = oauth[0]
  config.oauth_token_secret = oauth[1]
end

# pick a random word from the dictionary
def random_word
	[%x[perl -e '$dict = "/usr/share/dict/words"; $bytes= -s $dict; open IN, $dict;seek(IN,rand($bytes-11),0);$_=<IN>;$_=<IN>;print']]
end

# puts ifconfig[0] << random_word[0]

# Post a status update

Twitter.update(ifconfig[0] << random_word[0])


# todo
# Abstract everything to preferences file
# Add reply and query functionality
# Add communication with attached machines
