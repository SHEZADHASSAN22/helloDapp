// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16;

contract Election {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Hashmap to track candidates
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    // Constructor
    constructor () public{
        addCandidate("foo");
        addCandidate("faa");
    }
    // _ means local variable not global variable
    function addCandidate (string memory name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }
}