import sys


def check_parens(line):
    stack = []
    for i in range(0, len(line)):
        #print(stack)
        if line[i] == '(':
            stack.append(line[i])
        elif line[i] == ')':
            if len(stack) > 0:
                if stack[-1]  == '(':
                    stack.pop()
            else:
                return False
    if len(stack) >0:
        return False
    else:
        return True

def main():
    # Your solution riiiiight here.
    for line in sys.stdin:
        if(check_parens(line)):
            print("yes")
        else:
            print("no")

if __name__ == "__main__":
    main()
