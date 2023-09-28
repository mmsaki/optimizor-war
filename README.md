# Welcome Players!

Greetings, Huffoor! This document will guide you through the steps to solve this challenge and register your solution.

## Overview

This is an solver for `ExampleChallenge` in [Optimizor War](https://github.com/minaminao/optimizor-war).
The winner will be the submission with the lowest total gas.

*Ties will be decided by looking at submission time.

## Getting Started

1. **Clone the Repo**: Start by cloning this repository to your local machine.

```bash
git clone https://github.com/minaminao/optimizor-war-example-solver
```

2. **Solve the Challenge**: Dive into the [PLAYER_SOLUTION.huff](src/PLAYER_SOLUTION.huff) file and work your magic to solve the challenge.

3. **Testing**: While solving, you can utilize the test suite [Solution.t.sol](test/Solution.t.sol) to validate your solution. Feel free to make changes to this file; it won't affect the main challenge or your submission. It's just there to assist you.

## Registering Your Solution

Once you're confident in your solution, register it with the `OptimizorWar` contract on Optimism mainnet:

1. **Set Up Your Discord Handle**: Before running the registration script, set up an environment variable with your Discord handle (without the '@' symbol):

```bash
export PLAYER_HANDLE=minaminao
```

2. **Run the Registration Script**: Use the following commands to run the registration script:

First, commit your solution:

```bash
forge script SolutionScript --sig "commit()" --rpc-url <OPTIMISM RPC URL> --broadcast -vvvv
```

After 32 blocks, deploy and challenge your solution:

```bash
forge script SolutionScript --sig "deployAndChallenge()" --rpc-url <OPTIMISM RPC URL> --broadcast -vvvv
```

Note:
- These commands send live transactions on Optimism. Replace `<OPTIMISM RPC URL>` with a valid URL.
- You'll need to use an actual wallet for transactions. You can specify your wallet using the `--wallet` flag. Alternatively, you can input your private key in other ways, such as by using the `--interactive` flag. See [Foundry documentation](https://book.getfoundry.sh/) for more information.

## Wrapping Up

That's all there is to it!
Best of luck, and may the best coder win!
