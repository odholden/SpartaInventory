class NotifyController < ApplicationController
require 'slack-notify'

    def message

        client = SlackNotify::Client.new(
        webhook_url: 'https://hooks.slack.com/services/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',
        channel: '#inventory-test',
        username: 'notifybot',
        icon_url: 'http://mydomain.com/myimage.png',
        icon_emoji: ':shipit',
        link_names: 1
        )

        client.notify("testing")
    end


end