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

    // Keep track of who has voted
    mapping(address => bool) public voters;

    event votedEvent(
        uint indexed candidateId
    );


    // Constructor
    constructor() public{
        addCandidate("foo");
        addCandidate("faa");
    }
    // _ means local variable not global variable
    function addCandidate (string memory name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }

    function vote(uint candidateId) public {

        require(!voters[msg.sender]);
        require(candidateId > 0 && candidateId <= candidatesCount);
        // Solidity allows us to also add meta data 
        voters[msg.sender] = true;
        // Cast vote
        candidates[candidateId].voteCount++;

        emit votedEvent(candidateId);
    }
}