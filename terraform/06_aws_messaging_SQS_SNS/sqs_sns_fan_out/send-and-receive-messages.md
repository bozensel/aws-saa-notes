aws sns publish \
  --topic-arn <SNS_TOPIC_ARN> \
  --message "Hello Fan-Out!"

aws sqs receive-message \
  --queue-url <QUEUE1_URL>

aws sqs receive-message \
  --queue-url <QUEUE2_URL>
