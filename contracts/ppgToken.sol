// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import SafeMath library to perform safe arithmetic operations
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// Import ERC20 library to implement the ERC20 standard
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define the contract
contract ppgToken is ERC20 {
    // Use SafeMath library for safe arithmetic operations
    using SafeMath for uint256;

    // Define the constructor
    constructor(uint256 initialSupply) ERC20("ppgToken", "PPG") {
        // Mint the initial supply to the contract creator
        _mint(msg.sender, initialSupply);
    }

    // Add a function to mint new tokens
    function mint(uint256 amount) public {
        // Mint new tokens to the caller of the function
        _mint(msg.sender, amount);
    }

    // Add a function to burn tokens
    function burn(uint256 amount) public {
        // Burn tokens from the caller's balance
        _burn(msg.sender, amount);
    }

    // Remove the transfer and approve functions as they are already implemented in the ERC20 library

    // Add a function to check the balance of an account
    function getBalance(address account) public view returns (uint256) {
        // Return the balance of the account
        return balanceOf(account);
    }

    // Add a function to transfer tokens from the caller's account to another account
    function transferTokens(address recipient, uint256 amount) public {
        // Transfer tokens from the caller's account to the recipient's account
        transfer(recipient, amount);
    }

    // Add a function to allow another account to spend tokens from the caller's account
    function approveSpender(address spender, uint256 amount) public {
        // Approve the spender to spend the specified amount of tokens from the caller's account
        approve(spender, amount);
    }

    // Add a function to transfer tokens from one account to another account on behalf of the caller
    function transferFromAccount(address sender, address recipient, uint256 amount) public {
        // Transfer tokens from the sender's account to the recipient's account on behalf of the caller
        transferFrom(sender, recipient, amount);
    }

    // Add a function to check the allowance of a spender for a specific account
    function getAllowance(address owner, address spender) public view returns (uint256) {
        // Return the allowance of the spender for the specified owner account
        return allowance(owner, spender);
    }

    // Add a function to increase the allowance of a spender for the caller's account
    function increaseAllowance(address spender, uint256 addedValue) public override returns (bool) {
        // Increase the allowance of the spender for the caller's account
        address owner = _msgSender();
        approve(spender, allowance(owner, spender) + addedValue);
        return true;
    }

    // Add a function to decrease the allowance of a spender for the caller's account
    function decreaseAllowance(address spender, uint256 subtractedValue) public override returns (bool) {
        // Decrease the allowance of the spender for the caller's account
        address owner = _msgSender();
       uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }
        return true;
    }
}