require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    let(:project) { described_class.new }

    it "requires a name" do
      expect(project).not_to be_valid
      expect(project.errors["name"]).to include("can't be blank")
    end
  end
end
