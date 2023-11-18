// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductInventory {
    address public owner;
    mapping(string => uint256) public stock;

    event ProductReceived(string product, uint256 quantity);
    event ProductSold(string product, uint256 quantity);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function receiveProduct(string memory product, uint256 quantity) public onlyOwner {
        stock[product] += quantity;
        emit ProductReceived(product, quantity);
    }

    function sellProduct(string memory product, uint256 quantity) public onlyOwner {
        require(stock[product] >= quantity, "Insufficient stock");
        stock[product] -= quantity;
        emit ProductSold(product, quantity);
    }

    function displayStock(string memory product) public view returns (uint256) {
        return stock[product];
    }
}
