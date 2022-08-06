package main

import (
	"bufio"
	"fmt"
	"os"
	"container/list"
)

func checkParens(line string) bool {
	stack := list.New()
	for _,s :=range line {
		if s == '(' {
			stack.PushBack(s)
		} else {
			if s == ')' {
				if stack.Len() >0 {
					if stack.Back().Value == '(' {
						stack.Remove(stack.Back())
					}
				} else {
					return false
				}
			}
		}
	}

	if stack.Len() >0 {
		return false
	} else {
		return true
	}
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanLines)
	for scanner.Scan() {
		str := scanner.Text()
		fmt.Println(str)
		if checkParens(str) {
			fmt.Println("yes")
		} else {
			fmt.Println("no")
		}
	}
}
