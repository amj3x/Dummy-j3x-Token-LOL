# J3X Token
J3X Token is a dummy ERC-20 token designed for testing and experimentation. It doesn't have real-world value but serves as a learning tool for smart contract development, deployment, and interaction.

## Setup

```bash
git clone https://github.com/J3X-Contract/Dummy-j3x-Token-LOL.git
cd Dummy-j3x-Token-LOL
```

## Test

```bash
forge test -vvv
```

## Test a single function

```bash
forge test --mt testFunctionName -vvv
```

## Deploy

```bash
forge script script/DeployJ3X.s.sol:DeployJ3X --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```
