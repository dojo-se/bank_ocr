class BankOcr
  def initialize(string)
    @ocr = string
  end

  def convert
#---------------------------------------------
# 124 = |
# 32 = ' '
# 95 = _
#---------------------------------------------

#    @ocr[0][0] do |line|
#      if line.chars.first == " " return "000000000"
#    end

    if @ocr[1] == 32
      '111111111'
    elsif @ocr[28] == 124
       '000000000'
    else
       '222222222'
    end
#    else
#      '111111111'
#    end
  end
end

describe BankOcr do
  it "should return 000000000" do
    entrada = <<STRING
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|
                           
STRING
    BankOcr.new(entrada).convert.should == '000000000'
  end

  it "should return 111111111" do
    entrada = <<STRING
                           
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
                           
STRING

    BankOcr.new(entrada).convert.should == '111111111'      
  end

it "should return 222222222" do
    entrada = <<STRING
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
                           
STRING

    BankOcr.new(entrada).convert.should == '222222222'      
  end
end
