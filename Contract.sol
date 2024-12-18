// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    // Адрес владельца кошелька
    address public owner;

    // Конструктор, который устанавливает владельца контракта
    constructor() {
        owner = msg.sender;
    }

    // Модификатор для проверки, что вызов выполняет владелец
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Функция для внесения средств в контракт
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
    }

    // Функция для проверки баланса контракта
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Функция для снятия средств владельцем
    function withdraw(uint256 _amount) public onlyOwner {
        require(_amount <= address(this).balance, "Insufficient funds");
        payable(owner).transfer(_amount);
    }
}
