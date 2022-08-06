def check_parens(line)
  stack = []
  for i in 0..line.length() do
    #print(stack)
    if line[i] == '('
      stack.push(line[i])
    elsif line[i] == ')'
      if stack.length() > 0
        if stack[-1]  == '('
          stack.pop()
        end
      else
        return FALSE
      end
    end
  end

  if stack.length() >0
    return FALSE
  else
    return TRUE
  end
end


while line = gets do
  if check_parens(line)
    puts "yes"
  else
    puts "no"
  end
end
