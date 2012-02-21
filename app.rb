require 'rubygems'
require 'cgi'
require 'sinatra'
require 'pony'

Pony.options = {
	:to => ENV['GMAIL_USERNAME'],
	:from => ENV['GMAIL_USERNAME'],
	:via => :smtp,
	:via_options => {
 		:address              => 'smtp.gmail.com',
 		:port                 => '587',
 		:enable_starttls_auto => true,
 		:user_name            => ENV['GMAIL_USERNAME'],
 		:password             => ENV['GMAIL_PASSWORD']
 		#:authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
 		#:domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
	}
}

get '/' do
	send_file File.join('public', 'index.html')
end

post '/' do
	Pony.mail(:subject => 'Web Site Contact', :html_body => "<p><b>Name:</b> #{CGI::escapeHTML(params[:name])}</p><p><b>Email:</b> #{CGI::escapeHTML(params[:email])}</p>")
	send_file File.join('public', 'index.html')
end