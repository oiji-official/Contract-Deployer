//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract A{
    address public owner_A;
    constructor(address eoa){
        //eoa - > externally owned account
        //we want the owner creator to just deploy contracts for A
        //after doing so all the instances of the contracts will be accessed and 
        //available to only available
        //Thus A will not have the byte code of the contracts
        //thereby it cannot be changed with a malicious intent
        //A only has the addresses of the instances of the contracts
        owner_A = eoa;
    }
}

contract Creator{
    address public ownerCreator;
    A[] public contracts_deployed_by_A;
    //contracts_deployed_by_A is a list holding all the instances 
    //of the contracts created by A
    constructor(){
        ownerCreator = msg.sender;
    }
    
    function deployA() public{
        A new_A_address = new A(msg.sender);
        contracts_deployed_by_A.push(new_A_address);
    }
}