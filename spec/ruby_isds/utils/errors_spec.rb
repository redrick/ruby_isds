RSpec.describe 'Errors' do
  it 'defines all necessarry error classes' do
    expect { RubyIsds::ConfigNotSet }.not_to raise_error
    expect { RubyIsds::HtmlResponseReceived }.not_to raise_error
  end
end
