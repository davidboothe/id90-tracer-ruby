require 'id90_tracer/request'

describe Id90Tracer::Request do
  before do
    described_class.reset
  end

  describe '#parent_request_id' do
    subject { described_class.parent_request_id }

    describe 'when a parent_request_id has not yet been set' do
      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end

    describe 'after setting a parent_request_id' do
      it 'returns the set parent_request_id' do
        expected_parent_request_id = 'CHRIS-B-WAS-HERE'
        described_class.parent_request_id = expected_parent_request_id

        expect(subject).to eq(expected_parent_request_id)
      end
    end
  end

  describe '#request_id' do
    subject { described_class.request_id }

    describe 'when a request_id has not yet been set' do
      it 'generates a new request_id' do
        new_request_id = 'STUBBED-NEW-REQUEST-ID'
        allow(SecureRandom).to receive(:uuid).and_return(new_request_id)

        expect(subject).to eq(new_request_id)
      end

      it 'returns the previously generated request_id' do
        previous_id = subject
        expect(subject).to eq(previous_id)
      end
    end

    describe 'after setting a request_id' do
      it 'returns the set request_id' do
        expected_request_id = 'CHRIS-B-WAS-HERE'
        described_class.request_id = expected_request_id

        expect(subject).to eq(expected_request_id)
      end
    end
  end

  describe '#trace_id' do
    subject { described_class.trace_id }

    describe 'when a trace_id has not yet been set' do
      it 'generates a new trace_id' do
        new_trace_id = 'STUBBED-NEW-TRACE-ID'
        allow(SecureRandom).to receive(:uuid).and_return(new_trace_id)

        expect(subject).to eq(new_trace_id)
      end

      it 'returns the previously generated trace_id' do
        previous_id = subject
        expect(subject).to eq(previous_id)
      end
    end

    describe 'after setting a trace_id' do
      it 'returns the set trace_id' do
        expected_trace_id = 'CHRIS-B-WAS-HERE'
        described_class.trace_id = expected_trace_id

        expect(subject).to eq(expected_trace_id)
      end
    end
  end
end
