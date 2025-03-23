// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GuessTheWord {
    string private secretWord;
    address public owner;
    bool public gameActive;
    mapping(address => bool) public guessed;

    event GameStarted(string hint);
    event WordGuessed(address indexed player, string word);
    event GameEnded(address winner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier isActive() {
        require(gameActive, "Game is not active");
        _;
    }

    constructor(string memory _secretWord, string memory hint) {
        owner = msg.sender;
        secretWord = _secretWord;
        gameActive = true;
        emit GameStarted(hint);
    }

    function guessWord(string memory _word) external isActive {
        require(!guessed[msg.sender], "You already guessed");
        guessed[msg.sender] = true;
        emit WordGuessed(msg.sender, _word);

        if (keccak256(abi.encodePacked(_word)) == keccak256(abi.encodePacked(secretWord))) {
            gameActive = false;
            emit GameEnded(msg.sender);
        }
    }
}
