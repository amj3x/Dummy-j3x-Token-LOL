// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {J3X} from "../src/J3X.sol";

contract DeployJ3X is Script {
    function run() external returns (J3X) {
        vm.startBroadcast();
        J3X j3x = new J3X();
        vm.stopBroadcast();
        return j3x;
    }
}   