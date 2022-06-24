pragma solidity ^0.8.9;


contract Token{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "RoseLand Token";
    string public symbol = "RST";
    uint public decimal = 18;

    event Tranfer(address indexed from, address indexed to, uint value);

    constructor(){
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns(uint){
        return balances[owner];
    }

    // Smart Contract Coding - Transfering tokens

    function transfer(address to, uint value) public returns(bool) {
         require(balanceOf(msg.sender) >= value, 'balance too low');
         balances[to] += value;
         emit Tranfer(msg.sender, to, value);
         return true;
    }

    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'balance too low');
        require(allownce[from][msg.sender] >= value, 'allwance too low');
        balances[to] += value; 
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    //Smart Contract - Delegated Transfer 
function approve(address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;   
    }
}
