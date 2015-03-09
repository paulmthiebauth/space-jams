require 'csv'


class Album

  def initialize(album_id, track_id, title, track_number, duration_ms, album_name, artists)
    @album_id = album_id
    @track_id = track_id
    @tracks = Array.new
    @duration_ms = duration_ms
    @album_name = album_name
    @artists = artists
  end

  def id
    @album_id
  end

  def tracks
    @tracks
  end

  def track_list
    track_list = []
    @tracks.each do |song|
      track_list << "-" + "#{song[:title]}"
    end
    track_list
  end

  def duration
    duration = 0
    @tracks.each do |song|
      duration = duration + song[:duration_ms].to_i
    end
    duration / 1000
  end

  def summary
    puts "\nName: #{@album_name}"
    puts "Artist: #{@artists} "
    puts "Duration(min.): " + Time.at(duration).strftime("%M:%S")
    puts "Tracks:\n#{track_list.join("\n")}"

  end
end
