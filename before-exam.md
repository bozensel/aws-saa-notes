# Listener rules for your Application Load Balancer 
The listener rules for your Application Load Balancer determine how it routes requests to targets. When a listener receives a request, it evaluates the request against each rule in priority order, starting with the lowest numbered rule. Each rule includes conditions to be met and the actions to perform when the conditions for the rule are met. This flexible routing mechanism allows you to implement sophisticated traffic distribution patterns, support multiple applications or microservices behind a single load balancer, and customize request handling based on your application's specific requirements.

# AWS Secrets Manager
It is a fully-managed service that helps you securely store, rotate, manage, and retrieve secrets—such as API keys, OAuth tokens, and database credentials—throughout their lifecycles. It eliminates the need to hardcode sensitive information in your application source code or configuration files.

# AWS Certificate Manager (ACM)

It is a managed AWS service that handles the provisioning, deploying, and automatic renewal of SSL/TLS certificates for your AWS websites and applications. It eliminates manual certificate management and integrates directly with services like Elastic Load Balancing (ELB), Amazon CloudFront, and Amazon API Gateway.

Automated Renewals: ACM provides managed renewals for Amazon-issued SSL/TLS certificates, preventing unexpected downtime due to expiration.
Supported Certificate Types: Supports public SSL/TLS certificates, wildcard domains, and private certificates (using AWS Private CA).Third-Party Imports: You can seamlessly import and manage certificates issued by external Certificate Authorities (CAs).
Secure Key Management: Private keys are safeguarded using strong encryption and rigorous key management best practices. 
Note: ACM does not automatically renew imported certificates. Manual renewal or notification is required.

# EventBrigde

EventBridge is a serverless service that uses events to connect application components together, making it easier for you to build scalable event-driven applications. Event-driven architecture is a style of building loosely-coupled software systems that work together by emitting and responding to events. Event-driven architecture can help you boost agility and build reliable, scalable applications.

EventBridge provides simple and consistent ways to ingest, filter, transform, and deliver events so you can build applications quickly.

# Amazon S3 Event Notifications

You can use the Amazon S3 Event Notifications feature to receive notifications when certain events happen in your S3 bucket. To enable notifications, add a notification configuration that identifies the events that you want Amazon S3 to publish. Make sure that it also identifies the destinations where you want Amazon S3 to send the notifications. You store this configuration in the notification subresource that's associated with a bucket. 

# What is Amazon Textract?What is Amazon Textract?

Amazon Textract helps you add document text detection and analysis to your applications. Using Amazon Textract, you can do the following:

- Detect typed and handwritten text in a variety of documents, including financial reports, medical records, and tax forms.

- Extract text, forms, and tables from documents with structured data, using the Amazon Textract Document Analysis API.

- Specify and extract information from documents using the Queries feature within the Amazon Textract Analyze Document API.

- Process invoices and receipts with the AnalyzeExpense API.

- Process ID documents such as drivers licenses and passports issued by U.S. government, using the AnalyzeID API.

- Upload and process mortgage loan packages, through automatic routing of the the document pages to the appropriate Amazon Textract analysis operations using the Analyze Lending workflow. You can retrieve analysis results for each document page or you can retrieve summarized results for a set of document pages.

- Use Custom Queries to customize the pretrained Queries feature using your data to support your down stream processing needs.

# ChangeMessageVisibility 

Changes the visibility timeout of a specified message in a queue to a new value. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. 

# Amazon Aurora PostgreSQL
Amazon Aurora PostgreSQL is a fully managed, enterprise-class relational database engine offered by AWS that provides up to three times the performance of standard PostgreSQL while remaining fully compatible with open-source PostgreSQL code, tools, and extensions. By separating compute from storage, it delivers the speed and availability of high-end commercial databases at an open-source price point. 


