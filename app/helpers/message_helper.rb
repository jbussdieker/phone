module MessageHelper
    def message_badge(message)
        "New" if message.new
    end

    def caller_name(message)
        n = Number.where("number = ?", message.number).first
        message.number
        n.name if n
    end
end
