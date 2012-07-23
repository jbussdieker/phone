xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_path) do
      xml.Play @song[:url]
    end
    xml.Redirect api_path
end

