module SqsHelper
  def self.sqs
    @sqs ||= Aws::SQS::Client.new
  end

  def self.dlq
    @dlq ||= get_or_create_active_job_dlq
  end

  def self.queue
    sqs.get_queue_url(queue_name: ENV.fetch('ACTIVE_JOB_QUEUE'))
  rescue Aws::SQS::Errors::NonExistentQueue
    create_active_job_queue
  end

  def self.get_que_arn(q)
    sqs.get_queue_attributes(queue_url: q.queue_url, attribute_names: %w(QueueArn)).attributes['QueueArn']
  end

  def self.get_or_create_active_job_dlq
    sqs.get_queue_url(queue_name: ENV.fetch('ACTIVE_JOB_DLQ'))
  rescue Aws::SQS::Errors::NonExistentQueue
    dlq = sqs.create_queue(queue_name: ENV.fetch('ACTIVE_JOB_DLQ'))
    Rails.logger.info("Created #{dlq.queue_url}")
    dlq
  end

  def self.create_active_job_queue
    attributes = {}
    attributes['RedrivePolicy'] = %({"maxReceiveCount":"5", "deadLetterTargetArn":"#{get_que_arn(dlq)}"})

    queue = sqs.create_queue(queue_name: ENV.fetch('ACTIVE_JOB_QUEUE'), attributes: attributes)
    Rails.logger.info("Created #{queue.queue_url}")
    queue
  end

  private_class_method :get_or_create_active_job_dlq
  private_class_method :create_active_job_queue
end
