// SPDX-License-Identifier: MIT
// Standard way to specify the license under which the code is released. This contract uses the MIT License.

pragma solidity ^0.6.0;
//Line specifies the version of the Solidity compiler to use (in this case, version 0.6.0 or higher)

import 'openzeppelin-contracts-06/math/SafeMath.sol';
// This line imports a library called SafeMath,which provides safe arithmetic operations to prevent integer overflow/underflow in Solidity version 0.6.0

contract Fallout {
  
  using SafeMath for uint256;
  // The using statement enables the use of the SafeMath library for unsigned integers (uint256) throughout the contract.
  mapping (address => uint) allocations;
  // This line declares a mapping that associates an address with an amount of ether (uint).
  address payable public owner;
  // This line declares a public variable that represents the owner of the contract.


  /* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
    // constructor function called when the contract is deployed. 
    // It sets the owner variable to the address of the deployer, and sets their allocation to the amount of ether sent with the deployment.
  }

  modifier onlyOwner {
	require(msg.sender == owner,"caller is not the owner");
	        _;
            // This is a custom modifier that ensures that only the contract owner can execute certain functions.
	    }

  function allocate() public payable {
    allocations[msg.sender] = allocations[msg.sender].add(msg.value);
    // This function allows any user to allocate ether to their own address. 
    // The amount of ether allocated is added to the allocations mapping for that user's address.
  }

  function sendAllocation(address payable allocator) public {
    require(allocations[allocator] > 0);
    allocator.transfer(allocations[allocator]);
    // This function allows any user to send their allocation of ether to another address. 
    // The function checks that the allocator has a positive allocation, then transfers the amount to the specified address.
  }

  function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
    // This function allows the contract owner to collect all ether stored in the contract. 
    // It transfers the entire balance to the owner's address.
  }

  function allocatorBalance(address allocator) public view returns (uint) {
    return allocations[allocator];
  }
  // This function allows anyone to view the allocation of ether for a specific address. 
  // It returns the amount of ether allocated to the specified allocator address.
}
