module MessageHelper
    def message_badge(message)
        "New" if message.new
    end
end
