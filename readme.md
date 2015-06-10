#Reddit Job Finder

This ruby script will search Reddit's /r/forhire for new jobs.

##Requirements
This is built to work on a Mac because I work on a Mac.

The `terminal-notifier` gem that's required only works with Mac notifications, so if you try and use this elsewhere, it won't load up correctly.

Install these gems: `gem install terminal-notifier json awesome_print`

##How To Use

It's pretty simple.

Just run `ruby app.rb` once you've installed your gems and it'll run and get new jobs from /r/forhire.

If you've never run it before, you're likely to get a bunch of notifications all at once. That's okay and expected.

Subsequent runs will not have nearly as many notifications.

You can set this up in a CRON job and run it every 5/10/20 minutes. Doesn't really matter.

Here's a cron job for every 5 minutes that ignores any output. You'll just see notifications if a new job has been posted since the last time the script ran.

`*/5 * * * * ruby app.rb >/dev/null 2>&1`

It stores all past job IDs that it's found in `./.ids` so they're out of sight, out of mind.
