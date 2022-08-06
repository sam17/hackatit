<?php
class Stack
{
    protected $stack;
    protected $size;
    protected $max_size;

    public function __construct($size = 50) {
        $this->stack = array();
        $this->size  = 0;
        $this->max_size = $size;
    }

    public function push($data) {
        if(count($this->stack) < $this->max_size) {
            array_unshift($this->stack, $data);
            $this->size +=1;
        } else {
            throw new RuntimeException("Stack overflow");
        }
    }
    public function pop() {
        if (empty($this->stack)) {
            throw new RuntimeException("Stack underflow");
        } else {
            $this->size -=1;
            return array_shift($this->stack);
        }
    }

    public function length() {
        return $this->size;
    }

    public function last() {
        $a = $this->stack[$this->size - 1];
        return $a;
    }

    public function show_stack() {
        foreach($this->stack as $item){
            echo $item . " ";
        }
        echo "\n";
    }
}

function check_parens($line) {
    $stack = new Stack();
    for ($i = 0; $i<strlen($line); $i+=1) {
        //$stack->show_stack();
        if ($line[$i] == '(') {
            $stack->push($line[$i]);
        }
        else {
            if ($line[$i] == ')') {
                if ($stack->length() > 0) {
                    if ($stack->last() == '(') {
                        $stack->pop();
                    }
                }
                else {
                        return false;
                }
            }
        }
    }
    if ($stack->length() >0) {
        return false;
    } 
    else {
        return true;
    }

}

$f = fopen( 'php://stdin', 'r' );

while( $line = fgets( $f ) ) {
  //echo $line;
   if (check_parens($line) == true) {
       echo "yes\n";
   }
   else {
       echo "no\n";
   }
}

fclose( $f );

?>
