+-------------+
|   Browser   |
+------+------+
       |
       v
+------+------------------+
|   API Gateway HTTP API |
|      GET /hello        |
+------+------------------+
       |
       v
+------+------------------+
|      AWS Lambda         |
|  hello-from-lambda      |
| returns:                |
| "Hello from Lambda"     |
+-------------------------+   
