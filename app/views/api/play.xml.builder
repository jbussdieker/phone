xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_path, :numDigits => 1) do
      xml.Play @song_url
    end
    xml.Redirect api_path
end

