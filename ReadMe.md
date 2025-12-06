MyToken (MTK)
Overview

MyToken is a simple ERC-20 token built on Ethereum for learning purposes. It allows users to transfer tokens, approve others to spend on their behalf, and track balances.

Token Details

Name: MyToken

Symbol: MTK

Decimals: 18

Total Supply: 1,000,000 MTK

Features

Transfer tokens between addresses

Approve and spend tokens via allowance

Emits Transfer and Approval events

Track balances of all accounts

How to Deploy

Open Remix IDE

Create a new file MyToken.sol and paste the contract code

Compile using Solidity 0.8.x

Deploy using JavaScript VM with the desired total supply

How to Use
Check Balance
balanceOf(address) → returns uint256

Transfer Tokens
transfer(address to, uint256 amount) → returns bool

Approve Spending
approve(address spender, uint256 amount) → returns bool

Transfer on Behalf
transferFrom(address from, address to, uint256 amount) → returns bool

Testing

Tested transfers, approvals, and transferFrom functions

Verified events and balances updated correctly

Skills Learned

Solidity, ERC-20 standard, smart contract deployment, Remix IDE, Git/GitHub, token testing, and basic blockchain development.