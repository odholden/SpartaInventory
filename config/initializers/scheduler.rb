require 'rufus-scheduler'

SLACK_NOTIFIER = Slack::Notifier.new(
    'https://hooks.slack.com/services/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'
)

scheduler = Rufus::Scheduler::singleton

# This is configured for GMT 3PM .cron uses UTC
scheduler.cron '00 14 * * *' do
	# Get all the items from the database
	# If item is overdue, ping
	items = Item.all
	items.each do |item|
		if item.current
			if item.current.due_date < DateTime.now
				SLACK_NOTIFIER.ping("Overdue Item: #{item.description} \nDate due: #{item.current.due_date} \nLender: #{User.find(item.current.lender_id).name} \nBorrower: #{User.find(item.current.borrower_id).name}")
			end
		end
	end
end