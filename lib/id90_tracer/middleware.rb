require 'id90_tracer/request'

module Id90Tracer
  class Middleware
    def initialize(app, opts = {})
      @app = app
    end

    def call(env)
      setup_request(env)

      @app.call(env)
    end

    private

    def setup_request(env)
      Request.reset

      if env.key?(Request::PARENT_REQUEST_ID_ENV)
        Request.parent_request_id = env[Request::PARENT_REQUEST_ID_ENV]
      end

      if env.key?(Request::RAILS_REQUEST_ID_ENV)
        Request.request_id = env[Request::RAILS_REQUEST_ID_ENV]
      end

      if env.key?(Request::TRACE_ID_ENV)
        Request.trace_id = env[Request::TRACE_ID_ENV]
      end

      env[Request::PARENT_REQUEST_ID_HEADER] = Request.parent_request_id
      env[Request::REQUEST_ID_HEADER] = Request.request_id
      env[Request::TRACE_ID_HEADER] = Request.trace_id
    end
  end
end
