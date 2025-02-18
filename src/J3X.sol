// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract J3X is ERC20 {
    constructor() ERC20("j3x", "J3X") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}   