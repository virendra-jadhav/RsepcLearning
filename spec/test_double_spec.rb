class UserInstance
  def name
    "Virendra"
  end
end
describe "test double specification" do
  it "double test" do
    user = double("User", name: "Virendra", admin?: true)

    expect(user.name).to eq "Virendra"
    expect(user.admin?).to be true
    
  end

  it "double test with typo error" do
    user = double("User", name: "Virendra", admin?: true)
    # user = double("User")

    allow(user).to receive(:naem) # typo, test still passes 😱

    expect(user.name).to eq "Virendra"
    expect(user.admin?).to be true
    user.naem
    
  end

  it "stubbs test" do
    calculator = double("Calculator")

    allow(calculator).to receive(:add).with(2, 3).and_return(5)

    expect(calculator.add(2, 3)).to eq 5

  end
  it "mock test" do
    email_service = double("EmailService")

    expect(email_service).to receive(:send_email)

    email_service.send_email

  end
  it "mock test with argument" do
    email_service = double("EmailService")

    expect(email_service).to receive(:send_email).with(2,3)

    email_service.send_email(2,3)

  end
  it "instance_double" do
    user = instance_double("User")

    allow(user).to receive(:name).and_return("Virendra")

  end
  it "instance_method check" do

    user = instance_double("UserInstance")
    allow(user).to receive(:naem)

    user.naem  # ← now verification happens

  end
  
  it "class double test" do
    user_class = class_double("User")

    allow(user_class).to receive(:find).with(1).and_return("fake user")

    expect(user_class.find(1)).to eq "fake user"

  end
  it "spy test" do
    logger = spy("Logger")

    logger.info("Started")

    expect(logger).to have_received(:info).with("Started")

  end
  
  
  
  
end

class OrderProcessor
  def initialize(payment_gateway)
    @payment_gateway = payment_gateway
  end

  def process
    @payment_gateway.charge
  end
end


describe OrderProcessor do
  it "charges the payment gateway" do
    gateway = instance_double("PaymentGateway")

    expect(gateway).to receive(:charge).and_return("50.00")

    # OrderProcessor.new(gateway).process

    expect(OrderProcessor.new(gateway).process).to eq("50.00")


  end


  it "charges the payment gateway success for caling twice" do
    gateway = instance_double("PaymentGateway")

    expect(gateway).to receive(:charge).twice.and_return("50.00")

    OrderProcessor.new(gateway).process

    expect(OrderProcessor.new(gateway).process).to eq("50.00")


  end

end




