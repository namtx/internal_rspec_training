RSpec.shared_examples "searchable resources" do
  it "renders search button" do
    expect(page).to have_content "Search"
  end
end
