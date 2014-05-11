class MoneyCalculator
	attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands
	attr_accessor :total_paid
	attr_accessor :total_cost
	
    
	
	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	
	@ones = ones.to_i
	@fives = fives.to_i
	@tens = tens.to_i
	@twenties = twenties.to_i
	@fifties = fifties.to_i
	@hundreds = hundreds.to_i
	@five_hundreds = five_hundreds.to_i
	@thousands = thousands.to_i
	
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
	
	@total_paid = ((@ones * 1) + (@fives * 5) + (@tens * 10) + (@twenties * 20) + (@fifties * 50) + (@hundreds * 100) + (@five_hundreds * 500) + (@thousands * 1000))
	end 
	
	def change(total_cost)
		@total_change = @total_paid - total_cost
		temp_change = @total_paid - total_cost
		
		if (temp_change >= 1000)
			change_thousands = temp_change / 1000
			temp_change = temp_change % 1000
		end
		
		if (temp_change >= 500)
			change_five_hundreds = temp_change / 500
			temp_change = temp_change % 500
		end
		
		if (temp_change >= 100)
			change_hundreds = temp_change / 100
			temp_change = temp_change % 100
		end
		
		if (temp_change >= 50)
			change_fifties = temp_change / 50
			temp_change = temp_change % 50
		end
		
		if (temp_change >= 20)
			change_twenties = temp_change / 20
			temp_change = temp_change % 20
		end
		
		if (temp_change >= 10)
			change_tens = temp_change / 10
			temp_change = temp_change % 10
		end
			
		if (temp_change >= 5)
			change_fives = temp_change / 5
			temp_change = temp_change % 5
		end
		
		if (temp_change >= 1)
			change_ones = temp_change / 1
			temp_change = temp_change % 1
		end
		
		return {:ones => change_ones, :fives => change_fives, :tens => change_tens, :twenties => change_twenties, :fifties => change_fifties, hundreds => change_hundreds, five_hundreds => change_five_hundreds, thousands => change_thousands}
	end	
end