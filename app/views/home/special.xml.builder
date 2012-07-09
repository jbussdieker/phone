xml.instruct!
xml.Response do
    xml.Say "GROOVY"
    xml.Play "http://api.twilio.com/2010-04-01/Accounts/ACe739cc5b6d5c37a5a23c10f50c1460a9/Recordings/REb8ab7da888a684142be29631089f6439"
    xml.Play "https://s3.amazonaws.com/jbussdieker/music/Josh-Wagon+Wheel.m4a"
    xml.Redirect "call"
end

