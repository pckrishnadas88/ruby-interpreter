=begin
Basic calculator Interpreter
can add, substract, multiply , divide with any number of operands at a time
Drawback : Lacks operator precedence
=end
class Interpreter 	
	attr_accessor :input
	def initialize
		@input = gets.chomp				
	end	
	def intepret		
		first_operand  = []		
		f              = []		
		operator       = '+'		
		array          = Array.new		
		lc             = 0

		@input.split.join.split("").each_with_index.map do |i, index|
			
			if i.is_number?
				first_operand.push(i)	
				if index == @input.length-1						
					array.push(first_operand.join("").to_i)					
				end
			elsif i.is_plus?				
				f = first_operand
				first_operand = nil
				first_operand = []				
				array.push(f.join("").to_i)
				array.push("+")
			elsif i.is_minus?			
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '-'				
				array.push(f.join("").to_i)
				array.push("-")
			elsif i.is_multi?				
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '*'				
				array.push(f.join("").to_i)
				array.push("*")
			elsif i.is_divide?				
				f = first_operand
				first_operand = nil
				first_operand = []				
				operator = '/'				
				array.push(f.join("").to_i)
				array.push("/")
			else
				puts "Illegal input exiting.."
				exit			
			end 			
			
			lc = lc+1
									
		end		
		#apply the appropriate operation on the inputs based on the operand			
		#puts "=======TOKENS======"		
		#puts array.inspect	
		result = 0
		array.each_with_index.map do |x, key|
			result = x if key == 0			
			if x == '+'
				if key == 0 
					result = add(result, array[key+1])
				else
			 		result = add(result, array [key+1])
			 	end
			elsif x == '-'
				if key == 0 
					result = minus(result, array[key+1])
				else
			 		result = minus(result, array [key+1])
			 	end
			elsif x == '*'
				if key == 0 
					result = multi(result, array[key+1])
				else
			 		result = multi(result, array [key+1])
			 	end	
			elsif x == '/'
				begin
					if key == 0 
						result = divide(result, array[key+1])
					else
				 		result = divide(result, array [key+1])
				 	end	
				rescue
					puts "Zero Divsion error"
					exit
				end	 
			end 
		end
		puts "Result is: "+result.to_s
	end	
	def print_token(type, value)
		puts type + ' '+ value
	end
	def add(f,s)
		return f.to_i + s.to_i
	end
	def minus(f,s)
		return f.to_i - s.to_i
	end
	def multi(f,s)
		return f.to_i * s.to_i
	end
	def divide(f,s)
		return f.to_i / s.to_i
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
