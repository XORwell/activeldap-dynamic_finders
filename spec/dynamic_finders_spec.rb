require 'spec_helper'

describe ActiveLdap::DynamicFinders do

  include_context "ldap"

  let!(:al_class){ User.new }
  let!(:not_al_class){ class Other; include ActiveLdap::DynamicFinders end }
 
  describe 'test data attributes' do
    it { expect(User.first.attribute_names).to include('cn') }
    it { expect(User.first.attribute_names).to include('displayName') }
    it { expect(User.first.attribute_names).to include('givenName') }
  end


  describe 'find_by_*' do
    
    context 'with matching attributes' do
      describe 'single attr finder' do
        it "does return searched entry" do
          expect(User.find_by_sn('jim-sn')).to have(1).items
        end
      end
      describe 'multiple attr finder' do
        it "does return searched entry" do
          expect(User.find_by_cn_and_sn('jim', 'jim-sn')).to have(1).items
        end
      end
    end
    
    context 'with mismatching attributes' do      
      describe 'single attr finder' do
        it "does NOT return searched entry" do
          expect(User.find_by_sn('wrong_name')).to have(0).items
        end
      end
      describe 'multiple attr finder' do
        it "does NOT return searched entry" do
          expect(User.find_by_cn_and_sn('jim', 'wrong_name')).to have(0).items
        end
      end
    end
  end
  
  describe 'respond_to?' do

    context "dynamic finders" do
      [:find_by_mail, :find_by_givenName, :find_by_cn_and_sn].each{ |finder|
        context 'ActiveLdap::Base inherited class' do
          it "Class DOES respond to find_by prefixed methods: #{finder}" do
            expect(User.respond_to?(finder)).to be_true
          end
          it "Instance does NOT respond to find_by prefixed methods: #{finder}" do
            expect(User.new.respond_to?(finder)).to be_false
          end
        end
        context 'Not ActiveLdap::Base inherited class' do
          it "Class does NOT respond to find_by prefixed methods: #{finder}" do
            expect(not_al_class.respond_to?(finder)).to be_false
          end
          it "Instance does NOT respond to find_by prefixed methods: #{finder}" do
            expect(not_al_class.respond_to?(finder)).to be_false
          end
        end
      }
      
      it "does NOT respond to find_by_* without attr" do
        expect(al_class.respond_to?('find_by_')).to be_false
      end
      it "does NOT respond to find_by" do
        expect(al_class.respond_to?('find_by')).to be_false
      end      
    end
  end

  describe 'run_find_by_method' do
    context 'on missing arguments' do
      it { expect{ User.find_by_cn_and_sn() }.to raise_error(ArgumentError, 'wrong number of arguments (0 for 2)') }
      it { expect{ User.find_by_cn_and_sn('jim') }.to raise_error(ArgumentError, 'wrong number of arguments (1 for 2)') }
      it { expect{ User.find_by_cn_and_sn('jim', '') }.to_not raise_error }
    end    
  end

  describe 'method_missing' do
    it "does NOT bubble errors for find_by.." do
      expect{ User.find_by_cn_and_sn('jim', '') }.to_not raise_error
    end
    it "DOES bubble errors for other missing methods" do
      expect{ User.any_other_method }.to raise_error
    end
  end

end