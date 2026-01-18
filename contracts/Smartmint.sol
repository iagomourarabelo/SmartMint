// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Smartmint
 * @dev Lightweight contract for SmartMint
 */
contract Smartmint is Ownable {
    
    mapping(bytes32 => bytes) public data;
    
    event DataStored(bytes32 indexed key, address indexed sender);
    
    constructor() Ownable(msg.sender) {}
    
    function store(bytes32 key, bytes calldata value) external {
        data[key] = value;
        emit DataStored(key, msg.sender);
    }
    
    function retrieve(bytes32 key) external view returns (bytes memory) {
        return data[key];
    }
}
