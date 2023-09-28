// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IOptimizorWar {
    function BLOCKS_TO_PREVENT_FRONT_RUNNING() external view returns (uint256);
    function commit(bytes32 key) external;
    function challenge(uint256 challengeId, address solverAddr, uint256 salt, string calldata solverHandle) external;
}
