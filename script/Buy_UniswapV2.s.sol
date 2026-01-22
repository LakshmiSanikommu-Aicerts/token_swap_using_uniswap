// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {IUniswapV2Router02} from "../src/interfaces/IUniswapV2Router.sol";
import {IERC20} from "../src/interfaces/IERC20.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import { Constants } from "./constants/Constants.sol";

contract BuyUSDT is Script {
    address USDT = DevOpsTools.get_most_recent_deployment("Usdc", block.chainid);
    address C365 = DevOpsTools.get_most_recent_deployment("CertsDemo", block.chainid);

    function run() external {
        vm.startBroadcast();

        IERC20(USDT).approve(Constants.ROUTER_UNISWAP_V2, type(uint256).max);

        address[] memory path = new address[](2);
        path[0] = USDT;
        path[1] = C365;

        IUniswapV2Router02(Constants.ROUTER_UNISWAP_V2)
            .swapExactTokensForTokens(
                100 * 1e6, // 100 USDT
                0,
                path,
                msg.sender,
                block.timestamp + 300
            );

        console2.log("Bought C365");

        vm.stopBroadcast();
    }
}
