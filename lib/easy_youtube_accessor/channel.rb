module EasyYoutubeAccessor
  class Channel

    attr_accessor(
      :channel_id,
      :google_plus_user_id,
      :title,
      :description,
      :published_at,
      :view_count,
      :comment_count,
      :subscriber_count,
      :video_count,
      :thumbnails
    )

    def initialize(
      channel_id:,
      google_plus_user_id:,
      title:,
      description:,
      published_at:,
      view_count:,
      comment_count:,
      subscriber_count:,
      video_count:,
      thumbnails:
    )
      self.channel_id = channel_id
      self.google_plus_user_id = google_plus_user_id
      self.title = title
      self.description = description
      self.published_at = published_at
      self.view_count = view_count.to_i
      self.comment_count = comment_count.to_i
      self.subscriber_count = subscriber_count.to_i
      self.video_count = video_count.to_i
      self.thumbnails = thumbnails
    end

    def self.find_by_id(id)
      EasyYoutubeAccessor.client.list_channels('id,snippet,statistics,contentDetails', id: Array(id).join(?,)).items.map do |item|
        self.new(
          channel_id:          item.id,
          google_plus_user_id: item.content_details.google_plus_user_id,
          title:               item.snippet.title,
          description:         item.snippet.description,
          published_at:        item.snippet.published_at,
          view_count:          item.statistics.view_count,
          comment_count:       item.statistics.comment_count,
          subscriber_count:    item.statistics.subscriber_count,
          video_count:         item.statistics.video_count,
          thumbnails:          item.snippet.thumbnails.to_h,
        )
      end
    end

    def videos(order: :date, limit: 30)
      EasyYoutubeAccessor::Video.find_by_channel_id(self.channel_id, order: order, limit: limit)
    end

    def videos_with_pager(order: :date, page_token: nil, max_results: 30)
      EasyYoutubeAccessor::Video.find_by_channel_id_with_pager(
        self.channel_id,
        order: order,
        page_token: page_token,
        max_results: max_results,
      )
    end

  end
end
