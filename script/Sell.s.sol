// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {IUniswapV2RouterSwap} from "../src/interfaces/IUniswapV2RouterSwap.sol";
import {Certs365} from "../src/Certs365.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract Sell is Script {
    address constant ROUTER = 0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3;
    address C365 = DevOpsTools.get_most_recent_deployment("Certs365", block.chainid);

    function run() external {
        vm.startBroadcast();

        Certs365(C365).approve(ROUTER, type(uint256).max);

        address[] memory path = new address[](2);
        path[0] = C365;
        path[1] = IUniswapV2RouterSwap(ROUTER).WETH();

        IUniswapV2RouterSwap(ROUTER)
            .swapExactTokensForETH(
                1 ether, // sell 1000 LAK
                0,
                path,
                msg.sender,
                block.timestamp + 300
            );

        console2.log("Sold LAK");

        vm.stopBroadcast();
    }
}
