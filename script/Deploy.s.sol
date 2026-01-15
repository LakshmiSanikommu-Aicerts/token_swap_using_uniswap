// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Script, console2 } from "forge-std/Script.sol";
import { MyToken } from "../src/MyToken.sol";
import { IUniswapV2Router02 } from "../src/interfaces/IUniswapV2Router.sol";

contract Deploy is Script {
    address constant UNISWAP_ROUTER =
        0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3; // Sepolia

    function run() external {
        vm.startBroadcast();

        // 1M tokens
        MyToken token = new MyToken(1_000_000 ether);

        // Approve Uniswap
        token.approve(UNISWAP_ROUTER, type(uint256).max);

        // Add liquidity with 0.00001 ETH
        IUniswapV2Router02(UNISWAP_ROUTER).addLiquidityETH{
            value: 0.0001 ether
        }(
            address(token),
            500_000 ether, // token side
            0,
            0,
            msg.sender,
            block.timestamp + 300
        );

        vm.stopBroadcast();

        console2.log("token : ", address(token));
    }
}
