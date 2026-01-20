// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {IUniswapV2RouterSwap} from "../src/interfaces/IUniswapV2RouterSwap.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract Buy is Script {
    address constant ROUTER = 0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3;
    address C365 = DevOpsTools.get_most_recent_deployment("CertsDemo", block.chainid);

    function run() external {
        vm.startBroadcast();

        address[] memory path = new address[](2);
        path[0] = IUniswapV2RouterSwap(ROUTER).WETH();
        path[1] = C365;

        IUniswapV2RouterSwap(ROUTER).swapExactETHForTokens{value: 0.001 ether}(
            0, path, msg.sender, block.timestamp + 300
        );

        vm.stopBroadcast();
    }
}
