// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    event NewWave(address indexed from, uint256 timestamp, string message);

    // A struct is basically a custom datatype where we can customize what we want to hold inside it.
    struct Wave {
        address waver; // The address of the user who waved
        string message; // The message of user who waved
        uint256 timestamp;// The timestamp when the user waved.
    }

    Wave[] waves;

    constructor() {
        console.log("I am a contract. pog.");
    }

    function wave (string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender, _message);
        // store data i the array
        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves () public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves () public view returns (uint256) {
        console.log("We Have %d total waves!", totalWaves);
        return totalWaves;
    }
}