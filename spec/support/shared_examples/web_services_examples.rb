RSpec.shared_examples 'web service' do
  describe '.call' do
    it 'calls instance method' do
      params = {}
      web_service = double
      allow(described_class).to receive(:new).and_return(web_service)
      expect(web_service).to receive(:call)
      described_class.call(params)
    end
  end
end
