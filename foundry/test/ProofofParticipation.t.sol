//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../lib/forge-std/src/Test.sol";
import { ProofofParticipation } from "../src/ProofofParticipation.sol";

contract ProofofParticipationTest is Test {

  ProofofParticipation pop;

  function setUp() public {
    pop = new ProofofParticipation();
  }

  function testBalanceFind() public {
    uint256 result = pop.checkParticipation();
    console.log(result);
  }


}