xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_path) do
        xml.Say "Are You Ready To Jam?"
        xml.Say "Press 1 for Songs"
        xml.Say "Press 2 for Artists"
        xml.Say "Press 0 to return"
    end
    xml.Redirect(api_path)
end
