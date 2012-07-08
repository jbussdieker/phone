xml.instruct!
xml.Response do
    xml.Gather(:action => "music", :numDigits => 1) do
        xml.Say "Are You Ready To Jam?"
        xml.Say "Press 1 for All Around You, Press 2 for Master Plan, Press 3 for Wagon Wheel, Press 4 for Flight 180 and Press 5 for Only Fools Rush In, Press 0 to Return"
    end
end
