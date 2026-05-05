aws sqs send-message \
  --queue-url https://sqs.eu-central-1.amazonaws.com/<ACCOUNT-ID>/DemoQueue1 \
  --message-body "Hello from CLI"

aws sqs receive-message \
  --queue-url https://sqs.eu-central-1.amazonaws.com/<ACCOUNT-ID>/DemoQueue1