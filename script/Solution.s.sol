// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {Utils} from "src/utils/Utils.sol";
import {CHALLENGE_ID} from "src/Config.sol";

contract SolutionScript is Script, Utils {
    uint256 salt = 0; // CHANGE FOR EACH SOLUTION

    // forge script SolutionScript --sig "commit()" -vvvv --broadcast
    function commit() public {
        bytes32 codehash = codeHash();
        bytes32 key = keccak256(abi.encode(msg.sender, codehash, salt));

        vm.broadcast();
        optimizorWar.commit(key);
    }

    // forge script SolutionScript --sig "deployAndChallenge()" -vvvv --broadcast
    function deployAndChallenge() public {
        string memory solverHandle = playerHandle();

        vm.startBroadcast();
        address solver = deploy();
        optimizorWar.challenge(CHALLENGE_ID, address(solver), salt, solverHandle);
        vm.stopBroadcast();
    }
}
