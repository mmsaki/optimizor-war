// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

import {compileWithVersion, create, EvmVersion} from "huff-runner/Deploy.sol";
import {IOptimizorWar} from "./IOptimizorWar.sol";
import {CHALLENGE_ID} from "src/Config.sol";

using {compileWithVersion} for Vm;
using {create} for bytes;

contract Utils is Test {
    IOptimizorWar optimizorWar =
        IOptimizorWar(0x7ef472638fCf72216466D20C92265F9eEac5C716);

    function codeHash() public returns (bytes32) {
        return deploy().codehash;
    }

    function playerHandle() public view returns (string memory PLAYER_HANDLE) {
        PLAYER_HANDLE = vm.envString("PLAYER_HANDLE");
        require(
            keccak256(abi.encode(PLAYER_HANDLE)) != keccak256(abi.encode("")),
            "IMPORTANT: PLAYER to update env var PLAYER_HANDLE"
        );
    }

    function getCreationCode() public returns (bytes memory) {
        return
            vm.compileWithVersion("src/PLAYER_SOLUTION.huff", EvmVersion.Paris);
    }

    function deploy() public returns (address) {
        return getCreationCode().create({value: 0});
    }

    function verify() public {
        uint256 salt = 0;
        address solverAddr = deploy();
        bytes32 key = keccak256(
            abi.encode(address(this), solverAddr.codehash, salt)
        );
        string memory solverHandle = playerHandle();

        optimizorWar.commit(key);
        vm.roll(block.number + optimizorWar.BLOCKS_TO_PREVENT_FRONT_RUNNING());
        optimizorWar.challenge(CHALLENGE_ID, solverAddr, salt, solverHandle);
    }
}
