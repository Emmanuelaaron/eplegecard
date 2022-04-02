require "application_system_test_case"

class PledgersTest < ApplicationSystemTestCase
  setup do
    @pledger = pledgers(:one)
  end

  test "visiting the index" do
    visit pledgers_url
    assert_selector "h1", text: "Pledgers"
  end

  test "creating a Pledger" do
    visit pledgers_url
    click_on "New Pledger"

    fill_in "Amount", with: @pledger.amount
    fill_in "Expecteddate", with: @pledger.expecteddate
    check "Fullfilled" if @pledger.fullfilled
    fill_in "Name", with: @pledger.name
    fill_in "Phonenumber", with: @pledger.phonenumber
    click_on "Create Pledger"

    assert_text "Pledger was successfully created"
    click_on "Back"
  end

  test "updating a Pledger" do
    visit pledgers_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @pledger.amount
    fill_in "Expecteddate", with: @pledger.expecteddate
    check "Fullfilled" if @pledger.fullfilled
    fill_in "Name", with: @pledger.name
    fill_in "Phonenumber", with: @pledger.phonenumber
    click_on "Update Pledger"

    assert_text "Pledger was successfully updated"
    click_on "Back"
  end

  test "destroying a Pledger" do
    visit pledgers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pledger was successfully destroyed"
  end
end
