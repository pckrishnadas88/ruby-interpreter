=begin
Basic calculator Interpreter
can add, substract, multiply , divide with any number of operands at a time
=end
class Interpreter 
	Integer = 'INTEGER'
	Plus    = 'PLUS'
	Minus   = 'MINUS'
	Multi   = 'MULTPLICATION'
	Divide  = 'DIVISION'
	attr_accessor :input
	def initialize
		@input = gets.chomp				
	end	
	def intepret
		pos           = 0	
		first_operand = []		
		f             = []		
		operator      = '+'	
		hash          = Hash.new(2)

		@input.split.join.split("").each_with_index.map do |i, index|
			
			if i.is_number?
				first_operand.push(i)				
				sub_hash = Hash.new(2)
				sub_hash['token_type'] = Integer
				sub_hash['value'] = i	
				hash[index] = sub_hash			
			elsif i.is_plus?
				f = first_operand
				first_operand = nil
				first_operand = []
				sub_hash = Hash.new(2)
				sub_hash['token_type'] = Plus
				sub_hash['value'] = i	
				hash[index] = sub_hash
			elsif i.is_minus?
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '-'
				sub_hash = Hash.new(2)
				sub_hash['token_type'] = Minus
				sub_hash['value'] = i	
				hash[index] = sub_hash
			elsif i.is_multi?
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '*'
				sub_hash = Hash.new(2)
				sub_hash['token_type'] = Multi
				sub_hash['value'] = i	
				hash[index] = sub_hash
			elsif i.is_divide?
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '/'
				sub_hash = Hash.new(2)
				sub_hash['token_type'] = Divide
				sub_hash['value'] = i	
				hash[index] = sub_hash
			else
				puts "Illegal input exiting.."
				exit			
			end 
									
		end		
		#apply the appropriate operation on the inputs based on the operand
		add(f, first_operand ) if '+' == operator 
		minus(f, first_operand ) if '-' == operator 		
		multi(f, first_operand ) if '*' == operator 		
		divide(f, first_operand ) if '/' == operator 	
		puts "=======TOKENS======"
		puts hash.inspect			
	end	
	def print_token(type, value)
		puts type + ' '+ value
	end
	def add(f,s)
		puts f.join("").to_i + s.join("").to_i
	end
	def minus(f,s)
		puts f.join("").to_i - s.join("").to_i
	end
	def multi(f,s)
		puts f.join("").to_i * s.join("").to_i
	end
	def divide(f,s)
		puts f.join("").to_i / s.join("").to_i
	end
end
# Override the string class, to directly use methods like obj.is_number? rather than is_number?(obj)
class String
  def is_number?
    true if Float(self) rescue false
  end
  def is_plus?
  	true if self == '+' rescue false
  end
  def is_minus?
  	true if self == '-' rescue false
  end
  def is_multi?
  	true if self == '*' rescue false
  end
  def is_divide?
  	true if self == '/' rescue false
  end
end
#continue accepting inputs until exit CTRL + D
while true
	print 'pck>:'
	i_obj = Interpreter.new
	i_obj.intepret
end
