module Youtube
  class Video

    MAX_RESULTS = 50

    attr_accessor(
      :video_id,
      :channel_id,
      :category_id,
      :title,
      :description,
      :published_at,
      :view_count,
      :like_count,
      :dislike_count,
      :favorite_count,
      :comment_count,
      :thumbnails,
      :embed_html,
      :tags
    )

    def initialize(
      video_id:,
      channel_id:,
      category_id:,
      title:,
      description:,
      published_at:,
      view_count:,
      like_count:,
      dislike_count:,
      favorite_count:,
      comment_count:,
      thumbnails:,
      embed_html:,
      tags:
    )
      self.video_id = video_id
      self.channel_id = channel_id
      self.category_id = category_id.to_i
      self.title = title
      self.description = description
      self.published_at = published_at
      self.view_count = view_count.to_i
      self.like_count = like_count.to_i
      self.dislike_count = dislike_count.to_i
      self.favorite_count = favorite_count.to_i
      self.comment_count = comment_count.to_i
      self.thumbnails = thumbnails
      self.embed_html = embed_html
      self.tags = tags
    end

    def channel
      Youtube::Channel.find_by_id(self.channel_id).first
    end

    def self.find_by_id(id)
      Youtube.client.list_videos('id,snippet,statistics,player', id: Array(id).join(?,)).items.map do |item|
        self.new(
          video_id:       item.id,
          channel_id:     item.snippet.channel_id,
          category_id:    item.snippet.category_id,
          title:          item.snippet.title,
          description:    item.snippet.description,
          published_at:   item.snippet.published_at,
          view_count:     (item.statistics.view_count     rescue 0),
          like_count:     (item.statistics.like_count     rescue 0),
          dislike_count:  (item.statistics.dislike_count  rescue 0),
          favorite_count: (item.statistics.favorite_count rescue 0),
          comment_count:  (item.statistics.comment_count  rescue 0),
          thumbnails:     item.snippet.thumbnails.to_h,
          embed_html:     item.player.embed_html,
          tags:           item.snippet.tags
        )
      end
    end

    def self.find_by_channel_id_with_pager(channel_id, order: :date, page_token: nil, max_results: 30)
      r = Youtube.client.list_searches(
        'id',
        type: :video,
        channel_id: channel_id,
        order: order,
        max_results: max_results,
        page_token: page_token
      )

      video_ids = r.items.map {|item| item.id.video_id}
      videos = self.find_by_id(video_ids)
      [videos, r.next_page_token]
    end


    def self.find_by_channel_id(channel_id, order: :date, limit: 30)
      find_with_pagenation(limit) do |page_token|
        r = Youtube.client
          .list_searches(
            'id',
            type: :video,
            channel_id: channel_id,
            order: order,
            max_results: MAX_RESULTS,
            page_token: page_token
          )
      end
    end

    private

    def self.find_with_pagenation(limit, &block)
      videos = []
      max_results = limit
      page_token = nil

      while max_results > 0
        r = yield(page_token)

        page_token = r.next_page_token
        break unless page_token

        video_ids = r.items.map {|item| item.id.video_id}
        videos += self.find_by_id(video_ids)

        max_results = limit - videos.count
      end

      videos.slice(0, limit)
    end

  end
end
