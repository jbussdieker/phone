xml.instruct!
xml.Response do
    xml.Gather(:action => @post_to, :numDigits => 1) do
        xml.Say "Hello my love"
        xml.Play "https://s3.amazonaws.com/jbussdieker/music/All+Around+You.mp3"
    end
end
