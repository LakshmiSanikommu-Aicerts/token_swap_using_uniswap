// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {CertsDemo} from "../src/CertsDemo.sol";
import {Usdc} from "../src/Usdc.sol";
import {INonfungiblePositionManager} from "../src/interfaces/INonfungiblePositionManager.sol";
import {Constants} from "./constants/Constants.sol";
import {UniswapV3PriceMath} from "./utils/UniswapV3PriceMath.sol";

contract DeployV3 is Script {
    function run() external {
        vm.startBroadcast();

        // 1️⃣ Deploy CERTS token
        CertsDemo certs = new CertsDemo(Constants.CERTSDEMO_INITIAL_SUPPLY);

        // 2️⃣ Deploy custom USDC
        Usdc usdc = new Usdc();

        // 3️⃣ Mint USDC to deployer
        usdc.mint(msg.sender, Constants.USDC_LP_AMOUNT * 100);

        // 4️⃣ Approvals
        certs.approve(Constants.POSITION_MANAGER_PANCAKE, type(uint256).max);
        usdc.approve(Constants.POSITION_MANAGER_PANCAKE, type(uint256).max);

        // 5️⃣ Token ordering (required by V3)
        (address token0, address token1) =
            address(certs) < address(usdc) ? (address(certs), address(usdc)) : (address(usdc), address(certs));

        INonfungiblePositionManager pm = INonfungiblePositionManager(Constants.POSITION_MANAGER_PANCAKE);

        // 6️⃣ Initialize pool at $0.10 per CERTS
        // sqrtPriceX96 = sqrt( (amount1 / amount0) ) * 2^96
        bool certsIsToken0 = token0 == address(certs);
        uint160 sqrtPriceX96 = UniswapV3PriceMath.computeSqrtPriceX96(
            certsIsToken0, Constants.PRICE_USDC_PER_CERTS, Constants.CERTS_DECIMALS, Constants.USDC_DECIMALS
        );
        // uint160 sqrtPriceX96 = 250541448375047931186413801569; // precomputed for 0.10

        pm.createAndInitializePoolIfNecessary(token0, token1, Constants.PANCAKE_SWAP_FEE_2500, sqrtPriceX96);

        // 7️⃣ Mint full-range liquidity
        INonfungiblePositionManager.MintParams memory params = INonfungiblePositionManager.MintParams({
            token0: token0,
            token1: token1,
            fee: Constants.PANCAKE_SWAP_FEE_2500,
            tickLower: Constants.PANCAKE_SWAP_MIN_TICK,
            tickUpper: Constants.PANCAKE_SWAP_MAX_TICK,
            amount0Desired: address(certs) == token0 ? Constants.CERTS_LP_AMOUNT : Constants.USDC_LP_AMOUNT,
            amount1Desired: address(certs) == token1 ? Constants.CERTS_LP_AMOUNT : Constants.USDC_LP_AMOUNT,
            amount0Min: 0,
            amount1Min: 0,
            recipient: msg.sender,
            deadline: block.timestamp + 300
        });

        (uint256 tokenId,,,) = pm.mint(params);

        vm.stopBroadcast();

        console2.log("CERTS token:", address(certs));
        console2.log("Usdc token:", address(usdc));
        console2.log("LP NFT tokenId:", tokenId);
    }
}
