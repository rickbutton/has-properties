require "spec_helper"

describe HasProperties do
  
  class Test
    include HasProperties
    has_read_properties :one, :two
    has_write_properties :three, :four
    has_read_write_properties :five
    has_properties :six
  end
  
  before(:each) do
    @test = Test.new(:one => 'one', 
                     :two => 'two', 
                     :three => 'three', 
                     :four => 'four', 
                     :five => 'five',
                     :six => 'six')
  end
  
  it 'should generate the correct setters' do
    @test.one.should eq 'one'
    @test.two.should eq 'two'
    
    @test.respond_to?(:three).should be_false
    @test.respond_to?(:four).should be_false
    
    @test.five.should eq 'five'
    @test.six.should eq 'six'
  end
  
  it 'should generate the correct setters' do
    @test.respond_to?(:one=).should be_false
    @test.respond_to?(:two=).should be_false
    
    lambda { @test.three = 'new_three' }.should_not raise_error
    lambda { @test.four = 'new_four' }.should_not raise_error
    @test.five = 'new_five'
    @test.six = 'new_six'
    
    @test.five.should eq 'new_five'
    @test.six.should eq 'new_six'
  end
  
  it 'should not throw an error when extra parameters are used' do
    lambda { Test.new(:random => 'oops poop') }.should_not raise_error
  end
  
end