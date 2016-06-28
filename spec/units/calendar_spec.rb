describe Calendar do


subject(:calendar) {described_class.new(2016, 9, ["2016-09-12", "2016-09-13", "2016-09-14"])}

it 'starts with a year, month, and available days' do
  expect(subject.year).to eq 2016
  expect(subject.month).to eq 9
  expect(subject.available_dates).to eq ["2016-09-12", "2016-09-13", "2016-09-14"]
end 

it 'returns a hash of dates in the month with true for available dates' do
  expect(subject.list_dates).to include("2016-09-01" => false)
  expect(subject.list_dates).to include("2016-09-12" => true)
end

end