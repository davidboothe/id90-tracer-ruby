require 'id90_tracer/middleware'
require 'rack'

describe Id90Tracer::Middleware do
  subject(:middleware) { described_class.new(fake_app) }
  subject { middleware.call(fake_env) }

  let(:fake_app) { lambda { |env| [200, {'Content-Type' => 'text/plain'}, env['PATH_INFO']] } }
  let(:fake_env) { Rack::MockRequest.env_for('/anything.json') }

  it 'passes the rack lint checks' do
    app = Rack::Lint.new(middleware)
    app.call(fake_env)
  end

  describe 'when no headers are set' do
    it 'does not set parent_request_id' do
      expect(Id90Tracer::Request).to_not receive(:parent_request_id=)

      subject
    end

    it 'does not set request_id' do
      expect(Id90Tracer::Request).to_not receive(:request_id=)

      subject
    end

    it 'does not set trace_id' do
      expect(Id90Tracer::Request).to_not receive(:trace_id=)

      subject
    end
  end

  describe 'when a parent_request_id is set' do
    let(:fake_env) do
      Rack::MockRequest.env_for('/anything.json', {
        'HTTP_ID90_PARENT_REQUEST_ID' => parent_request_id
      })
    end
    let(:parent_request_id) { 'ZOMG-RAILS-IS-HERE' }

    it do
      expect(Id90Tracer::Request).to receive(:parent_request_id=).with(parent_request_id)

      subject
    end
  end

  describe 'when rails request_id is set' do
    let(:fake_env) do
      Rack::MockRequest.env_for('/anything.json', {
        'action_dispatch.request_id' => rails_request_id
      })
    end
    let(:rails_request_id) { 'ZOMG-RAILS-IS-HERE' }

    it do
      expect(Id90Tracer::Request).to receive(:request_id=).with(rails_request_id)

      subject
    end
  end

  describe 'when a trace_id is set' do
    let(:fake_env) do
      Rack::MockRequest.env_for('/anything.json', {
        'HTTP_ID90_TRACE_ID' => trace_id
      })
    end
    let(:trace_id) { 'ZOMG-RAILS-IS-HERE' }

    it do
      expect(Id90Tracer::Request).to receive(:trace_id=).with(trace_id)

      subject
    end
  end
end
