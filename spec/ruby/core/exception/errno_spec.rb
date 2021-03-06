require File.expand_path('../../../spec_helper', __FILE__)

describe "SystemCallError#errno" do
  it "needs to be reviewed for spec completeness"
end

describe "Errno::EMFILE" do
  it "can be subclassed" do
    ExceptionSpecs::EMFILESub = Class.new(Errno::EMFILE)
    exc = ExceptionSpecs::EMFILESub.new
    exc.should be_an_instance_of(ExceptionSpecs::EMFILESub)
  end
end

describe "Errno::EAGAIN" do
  # From http://jira.codehaus.org/browse/JRUBY-4747
  it "is the same class as Errno::EWOULDBLOCK if they represent the same errno value" do
    if Errno::EAGAIN::Errno == Errno::EWOULDBLOCK::Errno
      Errno::EAGAIN.should == Errno::EWOULDBLOCK
    else
      Errno::EAGAIN.should_not == Errno::EWOULDBLOCK
    end
  end
end
