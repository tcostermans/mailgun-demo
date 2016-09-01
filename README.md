# README

* **Prerequisites:**

Put all the env vars listed below in a file called .env.development in the root of the project.

When using the mailgun_rails gem in comibination with Active Job (backend: shoryuken) following env vars are expected to be there:

```
export MAILER_FROM_ADDRESS=noreply@unifiedpost.com
export MAILGUN_API_KEY=THE_KEY
export MAILGUN_DOMAIN=upnxt.mailgun.org
export ACTIVE_JOB_QUEUE=active_job_queue
export ACTIVE_JOB_DLQ=active_job_queue_dlq
```

When using smtp following env vars are expected to be there:

```
export MAILER_USERNAME=postmaster@upnxt.mailgun.org
export MAILER_PASSWORD=THE_PASSWORD
export MAILER_DOMAIN=upnxt.mailgun.org
export MAILER_ADDRESS=smtp.mailgun.org
export MAILER_PORT=587
```

Following env var should be always there:


```
export MAILER_FROM_ADDRESS=a_valid@email.com

```

Assumption:
AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to be set (use .env.local or other way)


* **To fire up the demo:**

Type following command in 2 different terminals:

```
foreman start web-local
source .env.development && foreman start web-worker
```

Go to http://localhost:5556/ in a browser.