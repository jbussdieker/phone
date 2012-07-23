xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_artists_path) do
        @artists.each_with_index do |artist,index|
          xml.Say "Press #{index+1} for #{artist}"
        end
        xml.Say "Press 0 to return"
    end
    xml.Redirect(api_music_path)
end
