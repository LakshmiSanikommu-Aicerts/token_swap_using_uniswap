// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Script, console2 } from "forge-std/Script.sol";
import { Certs365 } from "../src/Certs365.sol";
import { Usdc } from "../src/Usdc.sol";
import { INonfungiblePositionManager } from "../src/interfaces/INonfungiblePositionManager.sol";
import { Constants } from "./constants/Constants.sol";
import { Utils } from "./utils/lib.sol";

contract DeployV3 is Script {
    function run() external {
        vm.startBroadcast();

        // 1️⃣ Deploy CERTS token
        Certs365 certs = new Certs365(Constants.CERTS365_INITIAL_SUPPLY);

        // 2️⃣ Deploy custom USDC
        Usdc usdc = new Usdc();

        // 3️⃣ Mint USDC to deployer
        usdc.mint(msg.sender, Constants.USDC_LP_AMOUNT);

        // 4️⃣ Approvals
        certs.approve(Constants.POSITION_MANAGER, type(uint256).max);
        usdc.approve(Constants.POSITION_MANAGER, type(uint256).max);

        // 5️⃣ Token ordering (required by V3)
        (address token0, address token1) =
            address(certs) < address(usdc)
                ? (address(certs), address(usdc))
                : (address(usdc), address(certs));

        INonfungiblePositionManager pm =
            INonfungiblePositionManager(Constants.POSITION_MANAGER);

        // 6️⃣ Initialize pool at $0.10 per CERTS
        // Price = USDC / CERTS = 5000 / 50000 = 0.10
        // priceRaw = 0.10 * 10^6 / 10^18
        // sqrtPriceX96 = sqrt(priceRaw) * 2^96
        uint256 price = 100_000; // 0.10 * 1e6
        uint256 numerator = price << 192; // price * 2^192
        uint256 denominator = 1e18;       // CERTS decimals
        uint160 sqrtPriceX96 = uint160(
            Utils.sqrt(numerator / denominator)
        );
        // uint160 sqrtPriceX96 = 250541448375047931186413801569; // precomputed for 0.10

        pm.createAndInitializePoolIfNecessary(
            token0,
            token1,
            Constants.FEE_3000,
            sqrtPriceX96
        );

        // 7️⃣ Mint full-range liquidity
        INonfungiblePositionManager.MintParams memory params =
            INonfungiblePositionManager.MintParams({
                token0: token0,
                token1: token1,
                fee: Constants.FEE_3000,
                tickLower: Constants.MIN_TICK,
                tickUpper: Constants.MAX_TICK,
                amount0Desired: address(certs) == token0
                    ? Constants.CERTS_LP_AMOUNT
                    : Constants.USDC_LP_AMOUNT,
                amount1Desired: address(certs) == token1
                    ? Constants.CERTS_LP_AMOUNT
                    : Constants.USDC_LP_AMOUNT,
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
