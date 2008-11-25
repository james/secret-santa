$:.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
 
require 'rubygems'
require 'spec'
 
require 'secret_santa.rb'

describe "normalizing a string" do
  it "should strip the string of hyphens and spaces" do
    SecretSanta.normalize("W-. S ").should == "WS"
  end
  
  it "should capatlise all letters" do
    SecretSanta.normalize("qwertyupasdfghjkzxcvbnm").should == "QWERTYUPASDFGHJKZXCVBNM"
  end
  
  it "shoudl replace confusable letters and numbers" do
    SecretSanta.normalize("0O1lI2Z5S").should == "OOLLLZZSS"
  end
end

describe "generating a seed" do
  it "should only include storeable characters" do
    # You'll have to trust me on this
  end
end