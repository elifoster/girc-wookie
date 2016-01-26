require 'octokit'
require 'yaml'

module GIRC
  class Wookie
    # @return [Hash] The hash representation of the YAML config passed in the constructor.
    attr_reader :config

    def initialize(yamlfile)
      @config = YAML.load_file(yamlfile)
    end

    def run
      if @config['github'].key?('auth_code')
        @client = Octokit::Client.new(access_token: @config['github']['auth_code'])
        @client.user.login
      else
        @client = Octokit::Client.new(login: @config['github']['username'],
                                      password: @config['github']['password'])
      end

      rooms = @config['irc']['room'].gsub('\\', '')
      hook_config = {
        server: @config['irc']['server'],
        port: @config['irc']['port'],
        room: rooms,
        nick: @config['irc']['nick'],
        branches: @config['irc']['branches'],
        nickserv_password: @config['irc']['nickserv_password'],
        ssl: to_int_string(@config['irc']['ssl']),
        message_without_join: to_int_string(@config['irc']['no_join']),
        no_colors: to_int_string(@config['irc']['no_colors']),
        long_url: to_int_string(@config['irc']['long_url']),
        notice: to_int_string(@config['irc']['notice'])
      }

      if @config['github']['repo'].include? '/'
        repo = @config['github']['repo']
      else
        repo = "#{@config['github']['username']}/#{@config['github']['repo']}"
      end

      @client.create_hook(repo, 'irc', hook_config)
    end

    private

    # Returns an integer string representing a boolean value.
    # @param boolean [Boolean]
    # @return [String] '1' if boolean is true, '0' if it is false.
    def to_int_string(boolean)
      boolean ? '1' : '0'
    end
  end
end
