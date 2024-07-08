# spec/models/string_calculator_spec.rb

require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number input" do
      expect(StringCalculator.add("1")).to eq(1)
    end
  end
end
