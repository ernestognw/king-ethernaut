// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.0;

import "forge-std/Test.sol";
import "../King.sol";
import "../SenderWithoutHandlingCallReturn.sol";

contract EOA {
    receive() external payable {}
}

contract SenderWithoutHandlingCallReturnTest is Test {
    EOA internal eoa;
    SenderWithoutHandlingCallReturn internal sender;
    King internal king;

    function setUp() public {
        eoa = new EOA();
        vm.startPrank(address(eoa));
        sender = new SenderWithoutHandlingCallReturn();
        king = new King();
        vm.stopPrank();
    }

    function testSenderWithoutHandlingCallReturnClaimsKingship() public {
        sender.send(address(king));
        assertEq(address(king._king()), address(sender));
    }
}
