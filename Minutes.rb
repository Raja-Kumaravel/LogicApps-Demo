require 'rss'

puts "Content-type: application/rss+xml\n\n"

rss = RSS::Maker.make("2.0") do |maker|
  maker.channel.author = "Raja Kumaravel"
  maker.channel.updated = Time.now.to_s
  maker.channel.title = "Minute by minute feed"
  maker.channel.link = "http://CGIChennaiRSSFeeds/minute.rss"
  maker.channel.description = "Minute by minute feed"

  t = Time.now

  10.times do |i|
    maker.items.new_item do |item|
      ts = t.strftime("%H-%M")
      item.link = "http://CGIChennaiRSSFeeds/minute.rss?t=#{ts}"
      item.title = "The time is #{ts}"
      item.updated = Time.at((t.to_f / 60).round * 60)

      t -= 60
    end
  end
end

puts rss
