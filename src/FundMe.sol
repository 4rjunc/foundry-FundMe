// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract FundMe {
  function fund() public payable{
    // Allow users to send $
    // Have a minimum $ sent 
    // How to send ETH to a contract
    require(msg.value > 1e18, "didn't send enough ETH"); // 1e18 = 1 ETH 

  }

  function withdraw() public {}

}
