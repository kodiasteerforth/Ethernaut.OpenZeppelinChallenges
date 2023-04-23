// SPDX-License-Identifier: MIT   
// SPDX license identifier for the contract.

pragma solidity ^0.8.0;    
// Solidity version used to compile the contract.

contract Telephone {    
//Contract declaration.

  address public owner;  
  // Public variable that represents the owner of the contract.

  constructor() {   
    owner = msg.sender;
    // Constructor function that sets the owner of the contract to the address that deployed the contract.
  }

  function changeOwner(address _owner) public {   
    if (tx.origin != msg.sender) {  
      owner = _owner;
    }
  }

  //  Function that allows changing the owner of the contract.
  //  If the origin of the transaction is not the same as the sender of the transaction, update the owner of the contract to the specified address.
}
