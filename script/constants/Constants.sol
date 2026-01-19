// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Constants {
    // ===== Uniswap V3 (Sepolia) =====

    /// @dev Uniswap V3 NonfungiblePositionManager (Sepolia)
    address internal constant POSITION_MANAGER =
        0x1238536071E1c677A632429e3655c799b22cDA52;

    /// @dev WETH on Sepolia
    address internal constant WETH =
        0xfFf9976782d46CC05630D1f6eBAb18b2324d6B14;

    /// @dev Standard volatile pair fee (0.30%)
    uint24 internal constant FEE_3000 = 3000;

    // TODO : need to modify these values later ( current range was from 0 to infinity )
    /// @dev Full range ticks (safe default)
    int24 internal constant MIN_TICK = -887220;
    int24 internal constant MAX_TICK = 887220;


    // ===== Certs365 =====

    /// @dev Initial supply of Certs365
    uint256 internal constant CERTS365_INITIAL_SUPPLY = 1_000_000 ether;


        // ===== Liquidity params =====
    uint256 internal constant CERTS_LP_AMOUNT = 50_000 ether;
    uint256 internal constant USDC_LP_AMOUNT = 5_000 * 1e6; // $5,000
}
