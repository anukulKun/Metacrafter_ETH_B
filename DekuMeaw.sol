// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract MyToken {

    // Public variables to store token details
    string public tokenName = "Deku Meaw";
    string public tokenAbbrv = "DM";
    uint256 public totalSupply = 0;

    // Mapping to store balances of addresses
    mapping (address => uint256) public balances;

    // Events for Mint and Burn actions
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    // Mint function to increase total supply and balance of the given address
    function mint(address _address, uint256 _value) public {
        totalSupply += _value;
        balances[_address] += _value;
        emit Mint(_address, _value);
    }

    // Burn function to decrease total supply and balance of the given address
    function burn(address _address, uint256 _value) public {
        require(balances[_address] >= _value, "No balance to burn");
        totalSupply -= _value;
        balances[_address] -= _value;
        emit Burn(_address, _value);
    }
}
