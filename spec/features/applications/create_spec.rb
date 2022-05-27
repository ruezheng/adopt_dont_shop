require 'rails_helper'

RSpec.describe 'New Application page' do
  let!(:application) { Application.create!(name: 'Sam', street_address: '123 Cherry ln', city: 'Boise', state: 'ID', zip_code: '83201')}

  it "has form to create new application" do
    visit 'applications/new'

    fill_in 'name', with: 'Sam'
    fill_in 'street_address', with: '123 Cherry ln'
    fill_in 'city', with: 'Boise'
    fill_in 'state', with: 'ID'
    fill_in 'zip_code', with: '83201'

    click_button "Submit"

    application = Application.last

    expect(application.name).to eq("Sam")
    expect(application.street_address).to eq('123 Cherry ln')
    expect(application.city).to eq('Boise')
    expect(application.state).to eq('ID')
    expect(application.zip_code).to eq(83201)

    expect(page).to have_content("Sam")
    expect(page).to have_content('123 Cherry ln')
    expect(page).to have_content('Boise')
    expect(page).to have_content('ID' )
    expect(page).to have_content(83201)
  end

  it "re-renders the new form if all information isnt given" do
    visit '/applications/new'

    fill_in 'name', with: 'Sam'
    fill_in 'street_address', with: '123 cherry ln'
    fill_in 'city', with: 'Boise'
    fill_in 'state', with: 'ID'

    click_button 'Submit'

    expect(page).to have_content("Error: All fields must be completed to submit!")
    expect(page).to have_current_path('/applications/new')
  end
end
