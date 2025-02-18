// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test,console} from "forge-std/Test.sol";
import {J3X} from "../src/J3X.sol";
import {DeployJ3X} from "../script/DeployJ3X.s.sol";

contract J3XTest is Test {
    J3X public j3x;
    DeployJ3X public deployJ3X;
    address public USER = makeAddr("user");

    function setUp() public {
        deployJ3X = new DeployJ3X();
        j3x = deployJ3X.run();
    }

    function testInitialSupply() public view {
        console.log("Initial Supply: %s", j3x.totalSupply());
        console.log("Balance of the user %s: %s",USER,j3x.balanceOf(USER));
        console.log("Balance of (this) %s: %s",address(this),j3x.balanceOf(address(this)));
        console.log("Balance of msg.sender %s: %s",msg.sender,j3x.balanceOf(msg.sender));

        assertEq(j3x.totalSupply(), 1000000 * 10 ** 18);
    }

    function testTransfer() public {
        vm.prank(msg.sender);
        j3x.transfer(address(0x1), 1000 * 10 ** 18);
        assertEq(j3x.balanceOf(address(0x1)), 1000 * 10 ** 18);
    }

    function testRevertTransferExceedingBalance() public {
        vm.prank(USER);
        vm.expectRevert();
        j3x.transfer(address(0x1), 1000000 * 10 ** 18); // More than balance
    }

    function testApproveAndAllowance() public {
        vm.prank(msg.sender);
        j3x.approve(address(0x1), 500 * 10 ** 18);
        
        assertEq(j3x.allowance(msg.sender, address(0x1)), 500 * 10 ** 18);
    }

    function testRevertTransferFromWithoutApproval() public {
        vm.prank(address(0x2));
        vm.expectRevert();
        j3x.transferFrom(msg.sender, address(0x3), 500 * 10 ** 18);
    }

    
}