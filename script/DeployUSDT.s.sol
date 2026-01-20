// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {CertsDemo} from "../src/CertsDemo.sol";
import {IUniswapV2Router02} from "../src/interfaces/IUniswapV2Router.sol";
import {IERC20} from "../src/interfaces/IERC20.sol";

contract DeployUSDT is Script {
    address constant ROUTER = 0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3;
    address constant USDT = 0x7169D38820dfd117C3FA1f22a697dBA58d90BA06;

    function run() external {
        vm.startBroadcast();

        // Deploy CertsDemo
        CertsDemo token = new CertsDemo(1_000_000 ether);

        // Approve router to pull C365
        token.approve(ROUTER, type(uint256).max);

        // Approve router to pull USDT
        IERC20(USDT).approve(ROUTER, type(uint256).max);

        // Add liquidity
        IUniswapV2Router02(ROUTER)
            .addLiquidity(
                address(token),
                USDT,
                100_000 ether, // 100,000 C365
                1000 * 1e6, // 10,000 USDT (USDT has 6 decimals)
                0,
                0,
                msg.sender,
                block.timestamp + 300
            );

        console2.log("CertsDemo:", address(token));
        console2.log("USDT pool created");

        vm.stopBroadcast();
    }
}
