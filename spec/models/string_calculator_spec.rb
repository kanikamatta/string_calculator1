# spec/models/string_calculator_spec.rb

require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end
  end
end
