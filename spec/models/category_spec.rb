require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { FactoryBot.build(:category) }

  describe "associations" do
    it { is_expected.to have_many(:doctors).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "scopes" do
    describe ".ordered" do
      it "returns categories ordered by name" do
        category_c = FactoryBot.create(:category, name: "Category C")
        category_a = FactoryBot.create(:category, name: "Category A")
        category_b = FactoryBot.create(:category, name: "Category B")

        ordered_categories = Category.ordered

        expect(ordered_categories).to eq([category_a, category_b, category_c])
      end
    end
  end
end
