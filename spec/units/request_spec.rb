require 'date'

describe Request do

  let(:available_date1) {double(:available_date, date: Date.parse('2016-08-09')) }
  let(:available_date2) {double(:available_date, date: Date.parse('2016-08-10')) }
  let(:available_dates) {[available_date1,available_date2]}

  it 'returns true when Requested date is included in available_dates' do
    expect(Request.valid_date?(available_dates, Date.parse('2016-08-09'))).to be true
  end

  it 'returns true when Requested date is included in available_dates' do
    expect(Request.valid_date?(available_dates, Date.parse('2016-08-11'))).to be false
  end

end
