// SPDX-License-Identifier: MIT   
// SPDX license identifier for the contract.

// coin flipping game - guess the correct outcome 10 times in a row ?

pragma solidity ^0.8.0;   
// Solidity version used to compile the contract.

contract CoinFlip {    
// Contract declaration.

  uint256 public consecutiveWins;   
  // Public variable to keep track of consecutive wins.
  uint256 lastHash;   
  // Variable to store the last block hash used for the coin flip.
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;  
  // Variable that represents the maximum value that can be returned by the blockhash function.

  constructor() {  
    consecutiveWins = 0;
    // Constructor function that initializes the consecutiveWins variable to zero
  }

  function flip(bool _guess) public returns (bool) {   
      // Function that flips a coin and returns a boolean value.
    uint256 blockValue = uint256(blockhash(block.number - 1));   
    //  Obtains the hash of the previous block.

    if (lastHash == blockValue) {   
      revert();
      // If the last hash used for the coin flip is the same as the current block hash, revert the transaction.
    }

    lastHash = blockValue;
    // Updates the lastHash variable with the current block hash.
    uint256 coinFlip = blockValue / FACTOR;  
    // Divides the block hash by the FACTOR to obtain a random value between 0 and 1.
    bool side = coinFlip == 1 ? true : false;   
    // Assigns true to side if the random value is 1, otherwise assigns false.

    if (side == _guess) {  
      consecutiveWins++;
      // If the guessed side matches the coin flip side, increment the consecutiveWins variable and return true.
      return true;
    } else {  
      consecutiveWins = 0;
      // If the guessed side does not match the coin flip side, reset the consecutiveWins variable to zero and return false.
      return false;
    }
  }
}
