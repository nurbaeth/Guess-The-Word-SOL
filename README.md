# Guess The Word

## Overview
**Guess The Word** is an on-chain word-guessing game built on Solidity. Players attempt to guess a predefined secret word. Each guess is recorded on the blockchain, ensuring transparency and fairness. The game ends when a player correctly guesses the word. No bets or rewards—just pure gameplay!

## Features
- 🔒 **Fully on-chain** — all guesses are stored transparently.
- 🎮 **Simple gameplay** — guess the word and win!
- 👤 **One guess per player** — each address can submit only one guess.
- 🛑 **Game ends automatically** when the correct word is guessed. 

## How It Works
1. The contract owner deploys the game with a secret word and an optional hint.
2. Players submit their guesses via the `guessWord` function. 
3. If a guess is correct, the game ends and no further guesses are allowed. 

## Deployment
To deploy the contract, use Remix, Hardhat, or Foundry: 
```solidity
constructor(string memory _secretWord, string memory hint)
```
Example:
```solidity
GuessTheWord("blockchain", "A technology for decentralized records")
```

## Interacting with the Contract
### Guess a word
```solidity
guessWord("blockchain")
```
If the guess is correct, the game will end, and no further guesses will be accepted.

## Events
- `GameStarted(string hint)`: Emitted when the game begins.
- `WordGuessed(address player, string word)`: Emitted when a player submits a guess.
- `GameEnded(address winner)`: Emitted when the correct word is guessed.

## License
This project is open-source and licensed under the MIT License.
