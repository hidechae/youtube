require "youtube/version"
require 'youtube/video'
require 'youtube/channel'
require 'google/apis/youtube_v3'

module Youtube

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_key
    @api_key
  end

  def self.client
    raise 'Please set api_key' unless self.api_key

    @client ||= begin
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.key = self.api_key
      service
    end
  end

end

# overwrite logger not to write log
module Google
  module Apis
    def self.logger
      Logger.new('/dev/null')
    end
  end
end
