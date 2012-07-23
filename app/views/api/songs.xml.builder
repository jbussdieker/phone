xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_songs_path(artist: params[:artist])) do
        @songs.each_with_index do |song,index|
          xml.Say "Press #{index+1} for #{song[:title]}"
        end
        xml.Say "Press 0 to return"
    end
    xml.Redirect(api_music_path)
end
