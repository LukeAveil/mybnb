describe Calendar do
  it 'returns an array of 365 dates' do
    expect(Calendar.days_for_next_year.count).to eq 365
  end

  it 'gives the date 1 year from now' do
    expect(Calendar.days_for_next_year.last).to eq Date.today + 364
  end
end
