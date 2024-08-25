# Aleo-Workshop Documentation: Building and Deploying Aleo Programs

## Introduction
This documentation outlines the steps taken during our workshop to build and deploy three different Aleo programs. The programs demonstrate basic arithmetic operations, token minting and transferring, and a simple voice messaging system using Aleo's privacy-preserving smart contracts. Each section describes the purpose of the program, the code implementation, and the commands used to deploy these programs to the Aleo network.

## Deployment Command
To deploy the programs to the Aleo network, use the following command: 
``` bash 
leo deploy --network testnet
```

## Task 1: Hello World

### Purpose
The `moovbootcamp_kufre` program is a simple smart contract that demonstrates how to perform a basic arithmetic operation (addition) using Aleo.

### Functionality
This program defines a `main` function that takes two public `u32` integers, `a` and `b`, adds them together, and returns the result as `c`.

### Program Execution Command
```bash
leo run main 3u32 2u32
```

![image](https://github.com/user-attachments/assets/a2032652-f94e-4796-ad75-4bad74ccc500)

### Deployment Link
[View Transaction](https://explorer.aleo.org/transaction/at1wuyvymd52l74fvdd47rhc6wk76nagpy7jkfstqnmel8njmcxq5fq8utacw)

## Task 2: Token Minting and Transfer

### Purpose
The `moovbootcamp_token_kufre` program demonstrates a basic example of minting and transferring a token on the Aleo network.

### Functionality
This program defines a `Token` record and two transitions: `mint` and `transfer`. The `mint` function creates a new token with a specified amount for an owner, while the `transfer` function allows the transfer of a specified amount of tokens to another address.

### Program Execution Commands

1. Minting:
   ```bash
   leo run mint <type_aleo_address> <type_amount>u64
   ```

2. Transferring:
   ```bash
   leo run transfer "<Token_Record>" <to_address> <amount>u64
   ```
   We were able to use the generated record from the first command as input into the second command's first input (remember), and then our to address and amount.

![image](https://github.com/user-attachments/assets/3ebabf49-4d4d-4161-ba4d-1868d9d839d4)

### Deployment Link
[View Transaction](https://explorer.aleo.org/transaction/at1a8u5f52t05j5h262qvr0ndmks5yxqf6gz4ar8xsrrsuvzv5wmu9sf5jdda)

## Task 3: Voice Messaging System

### Purpose
The `moovbootcamp_voice_kufre` program is a more complex example that involves sending voice messages between users on the Aleo network while ensuring data privacy and integrity.

### Functionality
This program allows users to send and receive voice messages. It uses a hashing mechanism to ensure that the message content and user identities are securely stored and processed on the Aleo blockchain. The program includes functions to send voice messages, update the state on-chain, and combine hash values of the owner and receiver.

### Program Execution Command
```bash
leo run combine_hash_owner_receiver <type_your_address> <type_friend_address>
```
This command takes two inputs: the first input is the owner address (`self.caller`), and the second input is the receiver address.

![image](https://github.com/user-attachments/assets/f4cb2fd3-94e8-44ff-9d3f-b4ead3d526c8)

### Deployment Link
[View Transaction](https://explorer.aleo.org/transaction/at1lsu2pft7kcr4tjt3yz6hk39k4pf9cqzlx3p8lv2kjzanlaudrgzs2zzt5w)

## Summary
In this workshop, we successfully wrote and deployed three Aleo programs:

1. **Arithmetic Operation** - A simple program for adding two numbers.
2. **Token Minting and Transfer** - A basic implementation of minting and transferring tokens.
3. **Voice Messaging System** - A complex program that sends and manages voice messages securely on-chain.
