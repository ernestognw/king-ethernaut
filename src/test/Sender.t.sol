// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.0;

import "forge-std/Test.sol";
import "../King.sol";
import "../Sender.sol";

contract EOA {
    receive() external payable {}
}

contract SenderTest is Test {
    EOA internal eoa;
    Sender internal sender;
    King internal king;

    function setUp() public {
        eoa = new EOA();
        vm.startPrank(address(eoa));
        sender = new Sender();
        king = new King();
        vm.stopPrank();
    }

    function testSenderClaimsKingship() public {
        sender.send(address(king));
        assertEq(address(king._king()), address(sender));
    }
}
