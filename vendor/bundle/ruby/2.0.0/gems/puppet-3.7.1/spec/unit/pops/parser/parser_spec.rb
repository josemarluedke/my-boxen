require 'spec_helper'
require 'puppet/pops'

describe Puppet::Pops::Parser::Parser do
  it "should instantiate a parser" do
    parser = Puppet::Pops::Parser::Parser.new()
    parser.class.should == Puppet::Pops::Parser::Parser
  end

  it "should parse a code string and return a model" do
    parser = Puppet::Pops::Parser::Parser.new()
    model = parser.parse_string("$a = 10").current
    model.class.should == Puppet::Pops::Model::Program
    model.body.class.should == Puppet::Pops::Model::AssignmentExpression
  end

  it "should accept empty input and return a model" do
    parser = Puppet::Pops::Parser::Parser.new()
    model = parser.parse_string("").current
    model.class.should == Puppet::Pops::Model::Program
    model.body.class.should == Puppet::Pops::Model::Nop
  end

  it "should accept empty input containing only comments and report location at end of input" do
    parser = Puppet::Pops::Parser::Parser.new()
    model = parser.parse_string("# comment\n").current
    model.class.should == Puppet::Pops::Model::Program
    model.body.class.should == Puppet::Pops::Model::Nop
    adapter = Puppet::Pops::Adapters::SourcePosAdapter.adapt(model.body)
    expect(adapter.offset).to eq(10)
    expect(adapter.length).to eq(0)
  end
end
