require 'date'
require 'octokit'
require './env.rb' if File.exists? './env.rb'

class Contribart

  attr_accessor :dates

  def initialize
    @client = Octokit::Client.new(:access_token => GH_TOKEN )
    @issues = Octokit.list_issues 'jshawl/contribart'
    @today = Date.today.to_s
    create_issues( 1 )
  end

  def create_issues count
    1.upto(count) do | c |
      title = @today + " - " +c.to_s
      @client.create_issue("jshawl/contribart", title, '')
    end
  end

end

c = Contribart.new