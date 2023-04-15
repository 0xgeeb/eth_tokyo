// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { Script } from "../lib/forge-std/src/Script.sol";
import { ProofofParticipation } from "../src/ProofofParticipation.sol";

contract DeployScript is Script {

  ProofofParticipation pop;
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);

    pop = new ProofofParticipation();

    vm.stopBroadcast();
  }

}