describe Calendar do

  subject(:calendar) { described_class.new([Date.parse('2016-09-12')]) }

  it 'starts with a year, month, and available days' do
    expect(subject.year).to eq 2016
    expect(subject.month).to eq 9
  end

  it 'returns a hash of dates in the month with true for available dates' do
    expect(subject.list_dates).to include(Date.parse("2016-09-01"))
    expect(subject.list_dates).to include(Date.parse("2016-09-12"))
  end

end
