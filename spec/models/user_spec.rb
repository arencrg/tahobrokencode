require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Check if there exists a user profile' do
		subject { described_class.new(name: "new name", contact: "798371298", location: "this is my new address") }

		context 'is there a user' do
			it "checks if a user was created" do
				expect(subject).not_to be_nil
			end
		end

  	context 'validation of each entry' do
  	  it "checks if there is a name" do
          expect(subject.name).not_to be_empty
      end
 	    it "checks if there is a contact number" do
          expect(subject.contact).not_to be_empty
        end
      it "checks if there is a location" do
          expect(subject.location).not_to be_empty
      end
    end
  end
end
