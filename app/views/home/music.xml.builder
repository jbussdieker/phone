xml.instruct!
xml.Response do
    xml.Gather(:action => "music", :numDigits => 1) do
        xml.Say "Are You Ready To Jam?"
        xml.Say "Press 1 for Don't Worry Be Happy, Press 2 for I'll Be Waiting, Press 3 for Finally Moving, Press 4 for Flight 180 and Press 5 for Only Fools Rush In, Press 0 to Return"
    end
end
