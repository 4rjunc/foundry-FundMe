// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



contract FundMe {
    uint256 public minimumUSD = 5e18;
    address[] public funders;
    mapping(address funders => uint256 amount) public addressToAmountFunded;
    function fund()public  payable  {
        require(getConversionRate(msg.value) >= minimumUSD, "not enough");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface price =  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        )= price.latestRoundData();
        return uint256(answer) * 1e10;
    }

    function getConversionRate(uint256 ethAmount) public  view  returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
