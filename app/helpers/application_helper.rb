module ApplicationHelper
    def to_pst value
        l value.in_time_zone("Pacific Time (US & Canada)"), :format => '%B %d, %Y %l:%M %p'
    end
end
