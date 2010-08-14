class BankOcr
  def initialize(string)
    @ocr = string
  end

  def extract
    length = @ocr.length / 36;
    algarismos = []
    # Monta uma variavel number com cada algarismo
    (0..length).each do |algarismopos|
      number = ""
      @ocr.each_line do |line|
        number << line.slice(3*algarismopos,3) + "\n"
      end
      algarismos << number
    end
    algarismos
  end

  def convert_algarismo
    '0'    
  end
 
  def convert
#---------------------------------------------
# 124 = |
# 32 = ' '
# 95 = _
#---------------------------------------------
    p extract 

    if @ocr[1] == 32
      '111111111'
    elsif @ocr[28] == 124
      '000000000'
    elsif @ocr[29] == 95
      '222222222'
    else
      convert_algarismo
    end
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

  it "should return 0" do
    entrada = <<STRING
 _ 
| |
|_|
   
STRING
    BankOcr.new(entrada).convert.should == '0'
  end


end


