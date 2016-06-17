require 'securerandom'

module Id90Tracer
  class Request
    PARENT_REQUEST_ID_KEY = 'parent_request_id'
    REQUEST_ID_KEY = 'request_id'
    TRACE_ID_KEY = 'trace_id'

    PARENT_REQUEST_ID_ENV = 'HTTP_ID90_PARENT_REQUEST_ID'
    RAILS_REQUEST_ID_ENV = 'action_dispatch.request_id'
    TRACE_ID_ENV = 'HTTP_ID90_TRACE_ID'

    PARENT_REQUEST_ID_HEADER = 'Id90-Parent-Request-Id'
    TRACE_ID_HEADER = 'Id90-Trace-Id'

    def self.parent_request_id
      Thread.current[PARENT_REQUEST_ID_KEY]
    end

    def self.parent_request_id=(new_id)
      Thread.current[PARENT_REQUEST_ID_KEY] = new_id
    end

    def self.reset
      Thread.current[PARENT_REQUEST_ID_KEY] = nil
      Thread.current[REQUEST_ID_KEY] = nil
      Thread.current[TRACE_ID_KEY] = nil
    end

    def self.request_id
      Thread.current[REQUEST_ID_KEY] ||= generate_new_id
    end

    def self.request_id=(new_id)
      Thread.current[REQUEST_ID_KEY] = new_id
    end

    def self.trace_id
      Thread.current[TRACE_ID_KEY] ||= generate_new_id
    end

    def self.trace_id=(new_id)
      Thread.current[TRACE_ID_KEY] = new_id
    end

    private

    def self.generate_new_id
      SecureRandom.uuid
    end
  end
end
