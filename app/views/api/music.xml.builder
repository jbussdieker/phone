xml.instruct!
xml.Response do
    xml.Gather(:action => api_music_path, :numDigits => 1) do
        xml.Say "Are You Ready To Jam?"
        xml.Say "Press 1 for Don't Worry Be Happy, Press 2 for I'll Be Waiting, Press 3 for Finally Moving, Press 4 for Flight 180, Press 5 for Only Fools Rush In, Press 6 for Beds are Burning and Press 7 for I Touch Myself, Press 0 to Return"
    end
end
