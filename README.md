# Web3Apps_Hackathon_2023-ETHurance
Contract: https://sepolia.etherscan.io/address/0x01A182c8A73059806b701a9E06eE3aed15D1D604#code

## What it does
The ETHurance blockchain hackathon project will provide decentralized smart contract insurance for the ETH/USD price. The users interact with this smart contract to buy insurance with 0.01 ETH. After ETH/USD price drops by $200 or more, users can cash out with 0.012 ETH. If the users would like to cash out before ETH/USD price drops by $200 or more, they can choose to cash out with 0.008 ETH.

## How we built it
We built it by deploying a solidity contract on the Sepolia testnet, and used Hardhat to develop, deploy, and verify the contract. To get the current ETH/USD price, we used the ETH/USD Sepolia Chainlink data feed. 

## Challenges we ran into
Testing this contract was difficult because setting up the Chainlink test on the local environment requires extra configurations on Hardhat. Therefore, we deployed the contract onto the Sepolia testnet, then manually tested the contract on the Sepolia testnet. 

## Accomplishments that we're proud of
We are proud of integrating Chainlink data feed into our smart contract, which enables our smart contract to execute based on inputs and outputs from the real world.

## What we learned
We learned the following topics from this project:
1. Chainlink data feed
2. Develop Solidity smart contract
3. Deploy and verify Sepolia testnet contract by Hardhat
    
    `npx hardhat verify --network sepolia 0x01A182c8A73059806b701a9E06eE3aed15D1D604`

## What's next for ETHurance
The next step for ETHurance is to make the buyInsurance able to take any amount of ETH, instead of just 0.01 ETH.
