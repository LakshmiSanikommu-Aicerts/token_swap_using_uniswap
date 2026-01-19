// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Script, console2 } from "forge-std/Script.sol";
import { IUniswapV2Router02 } from "../src/interfaces/IUniswapV2Router.sol";
import { IERC20 } from "../src/interfaces/IERC20.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract BuyUSDT is Script {
    address constant ROUTER = 0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3;
    address constant USDT   = 0x7169D38820dfd117C3FA1f22a697dBA58d90BA06;
    address constant C365   = 0x855892cFC4FeDEDc032aD9DCc22928FbBa8BDc2a;

    function run() external {
        vm.startBroadcast();

        IERC20(USDT).approve(ROUTER, type(uint256).max);

        address[] memory path = new address[](2);
        path[0] = USDT;
        path[1] = C365;

        IUniswapV2Router02(ROUTER).swapExactTokensForTokens(
            100 * 1e6,    // 100 USDT
            0,
            path,
            msg.sender,
            block.timestamp + 300
        );

        console2.log("Bought C365");

        vm.stopBroadcast();
    }
}
