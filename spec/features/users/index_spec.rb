require "rails_helper"

RSpec.feature "Users#index", type: :feature do
  context "Admin visits users index page" do
    before {visit users_path}
    include_examples "searchable resources"
  end
end
