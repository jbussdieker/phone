xml.instruct!
xml.Response do
    xml.Gather(:action => "music", :numDigits => 1) do
      xml.Play @song_url
    end
    xml.Redirect "call"
end

