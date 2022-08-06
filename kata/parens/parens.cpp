#include <iostream>
#include <vector>

using namespace std;

void print_vector(vector<char> vc) {
  cout<<"print";
  for (int i=0;i<vc.size();i++) {
    cout<<vc[i]<<" ";
  }
}

bool check_parens(string line) {
  vector<char> stack;
  for (int i=0;i<line.length();i++) {
    //cout<<stack;
    //print_vector(stack);
    if (line[i] == '(') {
      stack.push_back(line[i]);
    }
    else if (line[i] == ')') {
      if (stack.size() >0) {
        if (stack[stack.size()-1] == '(') {
            stack.pop_back();
        }
      }
      else {
        return false;
      }
    }
  }
  if (stack.size() > 0) {
    return false;
  }
  else {
    return true;
  }
}


int main() {
  for (std::string line; std::getline(std::cin, line);) {
    if (check_parens(line)) {
      cout<<"yes"<<endl;
    }
    else {
      cout<<"no"<<endl;
    }
  }
}
