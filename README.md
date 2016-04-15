# EasyYoutubeAccessor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/easy_youtube_accessor`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_youtube_accessor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_youtube_accessor

## Getting Started

Require and set your API key for your google app.

```ruby
require 'easy_youtube_accessor'
EasyYoutubeAccessor.api_key = YOUR_API_KEY
```

## Usage

Get video like

```ruby
EasyYoutubeAccessor::Video.find_by_id('qnZZInDyrZo')
=> [#<EasyYoutubeAccessor::Video:0x007f95427d6138
  @category_id=28,
  @channel_id="UCK8sQmJBp8GCxrOtXWBpyEA",
  @comment_count=907,
  @description=
   "Goals are hard work. Whether you want to read more books, learn a new language or work out regularly, it's getting harder and harder to find the time even when your goal really matters to you. So today we're introducing Goals in Google Calendar. You add a personal goal—like “run 3 times a week”—and Calendar will schedule time automatically and then help you actually stick to it.",
  @dislike_count=656,
  @embed_html="<iframe width=\"640\" height=\"360\" src=\"//www.youtube.com/embed/qnZZInDyrZo\" frameborder=\"0\" allowfullscreen></iframe>",
  @favorite_count=0,
  @like_count=5270,
  @published_at=#<DateTime: 2016-04-13T04:01:09+00:00 ((2457492j,14469s,0n),+0s,2299161j)>,
  @tags=["Google Calendar", "Goals", "Habits", "Calendar", "Agenda"],
  @thumbnails=
   {:default=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/default.jpg", :height=>90, :width=>120},
    :high=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/hqdefault.jpg", :height=>360, :width=>480},
    :medium=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/mqdefault.jpg", :height=>180, :width=>320},
    :maxres=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/maxresdefault.jpg", :height=>720, :width=>1280},
    :standard=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/sddefault.jpg", :height=>480, :width=>640}},
  @title="Goals in Google Calendar",
  @video_id="qnZZInDyrZo",
  @view_count=261059>]
```

Get channel like

```ruby
EasyYoutubeAccessor::Channel.find_by_id('UCK8sQmJBp8GCxrOtXWBpyEA')
=> [#<EasyYoutubeAccessor::Channel:0x007f95463b2e18
  @channel_id="UCK8sQmJBp8GCxrOtXWBpyEA",
  @comment_count=24,
  @description=
   "Experience the world of Google on our official YouTube channel. Watch videos about our products,  technology, company happenings and more. Subscribe to get updates from all your favorite Google products and teams.",
  @google_plus_user_id="116899029375914044550",
  @published_at=#<DateTime: 2005-09-18T22:37:10+00:00 ((2453632j,81430s,0n),+0s,2299161j)>,
  @subscriber_count=3924099,
  @thumbnails=
   {:default=>{:url=>"https://yt3.ggpht.com/-v0soe-ievYE/AAAAAAAAAAI/AAAAAAAAAAA/OixOH_h84Po/s88-c-k-no-rj-c0xffffff/photo.jpg"},
    :high=>{:url=>"https://yt3.ggpht.com/-v0soe-ievYE/AAAAAAAAAAI/AAAAAAAAAAA/OixOH_h84Po/s240-c-k-no-rj-c0xffffff/photo.jpg"},
    :medium=>{:url=>"https://yt3.ggpht.com/-v0soe-ievYE/AAAAAAAAAAI/AAAAAAAAAAA/OixOH_h84Po/s240-c-k-no-rj-c0xffffff/photo.jpg"}},
  @title="Google",
  @video_count=1684,
  @view_count=997552738>]
```

Get video list for specified channel lik

```ruby
EasyYoutubeAccessor::Video.find_by_channel_id('UCK8sQmJBp8GCxrOtXWBpyEA', limit: 2)
=> [#<EasyYoutubeAccessor::Video:0x007f9545d600b0
  @category_id=28,
  @channel_id="UCK8sQmJBp8GCxrOtXWBpyEA",
  @comment_count=907,
  @description=
   "Goals are hard work. Whether you want to read more books, learn a new language or work out regularly, it's getting harder and harder to find the time even when your goal really matters to you. So today we're introducing Goals in Google Calendar. You add a personal goal—like “run 3 times a week”—and Calendar will schedule time automatically and then help you actually stick to it.",
  @dislike_count=656,
  @embed_html="<iframe width=\"640\" height=\"360\" src=\"//www.youtube.com/embed/qnZZInDyrZo\" frameborder=\"0\" allowfullscreen></iframe>",
  @favorite_count=0,
  @like_count=5270,
  @published_at=#<DateTime: 2016-04-13T04:01:09+00:00 ((2457492j,14469s,0n),+0s,2299161j)>,
  @tags=["Google Calendar", "Goals", "Habits", "Calendar", "Agenda"],
  @thumbnails=
   {:default=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/default.jpg", :height=>90, :width=>120},
    :high=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/hqdefault.jpg", :height=>360, :width=>480},
    :medium=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/mqdefault.jpg", :height=>180, :width=>320},
    :maxres=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/maxresdefault.jpg", :height=>720, :width=>1280},
    :standard=>{:url=>"https://i.ytimg.com/vi/qnZZInDyrZo/sddefault.jpg", :height=>480, :width=>640}},
  @title="Goals in Google Calendar",
  @video_id="qnZZInDyrZo",
  @view_count=261059>,
 #<EasyYoutubeAccessor::Video:0x007f9545d531a8
  @category_id=28,
  @channel_id="UCK8sQmJBp8GCxrOtXWBpyEA",
  @comment_count=125,
  @description="Google Art Residency with Tristan Eaton, Jorge Rodriguez Gerada, Faith47, Said Dokins and Chu. \nLearn more about Tilt Brush: http://www.tiltbrush.com/\nLearn more about The Lab at Google Cultural Institute: https://www.google.com/culturalinstitute/thelab/",
  @dislike_count=51,
  @embed_html="<iframe width=\"640\" height=\"360\" src=\"//www.youtube.com/embed/91J8pLHdDB0\" frameborder=\"0\" allowfullscreen></iframe>",
  @favorite_count=0,
  @like_count=1665,
  @published_at=#<DateTime: 2016-04-05T15:56:38+00:00 ((2457484j,57398s,0n),+0s,2299161j)>,
  @tags=["Google", "Google Art", "Google Culture", "Street art", "Tilt Brush", "Google Artist Residency", "Google Cultural Institute"],
  @thumbnails=
   {:default=>{:url=>"https://i.ytimg.com/vi/91J8pLHdDB0/default.jpg", :height=>90, :width=>120},
    :high=>{:url=>"https://i.ytimg.com/vi/91J8pLHdDB0/hqdefault.jpg", :height=>360, :width=>480},
    :medium=>{:url=>"https://i.ytimg.com/vi/91J8pLHdDB0/mqdefault.jpg", :height=>180, :width=>320},
    :maxres=>{:url=>"https://i.ytimg.com/vi/91J8pLHdDB0/maxresdefault.jpg", :height=>720, :width=>1280},
    :standard=>{:url=>"https://i.ytimg.com/vi/91J8pLHdDB0/sddefault.jpg", :height=>480, :width=>640}},
  @title="Tilt Brush - The Lab at Google Cultural Institute",
  @video_id="91J8pLHdDB0",
  @view_count=223612>]
```

Notice: max size of list is 500.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/youtube. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

