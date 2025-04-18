# frozen_string_literal: true

require 'spec_helper'
require 'xui/form'

RSpec.describe 'Attribute Type: text' do
  let(:form) do
    Class.new(XUI::Form) do
      self.form_name = 'test'

      attribute :s, :text
    end
  end

  describe 'instantiation from a form submission' do
    it 'returns a string' do
      object = form.from_params 's' => 'otto'

      expect(object.s).to eq 'otto'
      expect(object).to be_valid
    end

    it 'converts empty string to nil' do
      object = form.from_params 's' => ''

      expect(object.s).to be_nil
      expect(object).to be_valid
    end

    it 'converts blank string to nil' do
      object = form.from_params 's' => '    '

      expect(object.s).to be_nil
      expect(object).to be_valid
    end

    it 'converts newlines to unix' do
      object = form.from_params 's' => "a\r\nb"

      expect(object.s).to eq "a\nb"
      expect(object).to be_valid
    end
  end

  describe 'instantiation from a service resource' do
    it 'returns a string' do
      object = form.from_resource 's' => 'otto'

      expect(object.s).to eq 'otto'
      expect(object).to be_valid
    end

    it 'converts empty string to nil' do
      object = form.from_resource 's' => ''

      expect(object.s).to be_nil
      expect(object).to be_valid
    end

    it 'converts blank string to nil' do
      object = form.from_resource 's' => '    '

      expect(object.s).to be_nil
      expect(object).to be_valid
    end

    it 'converts newlines to unix' do
      object = form.from_resource 's' => "a\r\nb"

      expect(object.s).to eq "a\nb"
      expect(object).to be_valid
    end
  end
end
