// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ETHurance {
    address public owner;
    AggregatorV3Interface internal dataFeed;
    mapping(address => int) public enterPrice;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    /**
     * Network: Sepolia
     * Aggregator: ETH / USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     * URL: https://docs.chain.link/data-feeds/price-feeds/addresses/?network=ethereum#Sepolia%20Testnet
     */
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        owner = msg.sender;
    }

    /**
     * Returns the latest answer as ETH/USD rate with 8 decimals
     */
    function getETHUSD() public view returns (int) {
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }

    function deposit() public payable onlyOwner {}

    function getTargetPrice(address user) public view returns (int) {
        return enterPrice[user] - 200*10**8;
    }

    function buyInsurance() public payable {
        require(msg.value == 10000000000000000, "You must only send 0.01 ETH.");
        require(
            enterPrice[msg.sender] == 0,
            "You already have an insurance policy."
        );
        int ethusd = getETHUSD();
        enterPrice[msg.sender] = ethusd;
    }

    function cashOut() public {
        require(
            enterPrice[msg.sender] != 0,
            "You don't have an insurance policy."
        );
        int ethusd = getETHUSD();
        int targetPrice = getTargetPrice(msg.sender);
        enterPrice[msg.sender] = 0;
        if (ethusd <= targetPrice) {
            payable(msg.sender).transfer(12000000000000000);
        } else {
            payable(msg.sender).transfer(8000000000000000);
        }
    }
}