require 'matrix'
class Rectangle

   def initialize(matrix, row, column)
    @matrix, @row, @column = matrix, row, column
    @no_of_Magic = 0
  end  

  def magic
    if @row < @column 
      min = @row
    else min = @column
    end
    
    for k in 2..min
       for i in 0..@row-k
       for j in 0..@column-k
      #Temp square
      temp = Array.new(k){Array.new(k)} 
       for p in i..k+i-1
       for q in j..k+j-1
       #Inicialisation of suares value
    temp[p-i][q-j] = @matrix[p,q]
     end
     end
     #Is it a magic square?
     isMagic(temp,k)
     end
     end
    end
  puts "Magic suares found :"
  puts @no_of_Magic
 end
 
#Print if magic square
 def isMagic(array, k)
   if checkSum(sumVertical(array),sumHorizontal(array), sumD2(array,k), sumD2(array,k)) == true
     array.each {|r| puts r.inspect}
     puts "\n"
  end
 end
#Sums of columns
def sumVertical(array)
  ver = Array.new
  ver = array.transpose.map{|x| x.reduce(:+)}
 return ver
end
#Sums of rows
def sumHorizontal(array)
  hor = Array.new
  hor = array.map{|x| x.reduce(:+)}
 return hor
end
#Sums of diagonals
def sumD1(array,k)
  sum = (0...k).collect { |i| array[i][i] }.reduce(0, :+)
return sum
end
def sumD2(array,k)
  sum = (0...k).collect { |i| array[i][-i-1]}.reduce(0, :+)
return sum
end

#Checking if sums are the same
def checkSum(hor,vert,d1,d2)
  k=0
  if (vert.uniq.sort == hor.uniq.sort)&&(vert[0] == d1 && d1 == d2)
    @no_of_Magic = @no_of_Magic+1
      return TRUE
  else
    return false
  end
end
end

m1 = Rectangle. new(Matrix[[4, 9, 2, 3, 5], [3, 5, 7, 4, 2],[8, 1, 6, 6, 2],[1, 1, 6, 6, 2]], 4, 5)
m1.magic