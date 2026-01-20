// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Constants {
    // ===== Uniswap V3 (Sepolia) =====

    /// @dev Uniswap V3 NonfungiblePositionManager (Sepolia)
    address internal constant POSITION_MANAGER = 0x1238536071E1c677A632429e3655c799b22cDA52;

    /// @dev pancakeswap V3 NonfungiblePositionManager (Sepolia)
    address internal constant POSITION_MANAGER_PANCAKE = 0x46A15B0b27311cedF172AB29E4f4766fbE7F4364;

    /// @dev Standard volatile pair fee (0.30%)
    uint24 internal constant FEE_3000 = 3000;

    // TODO : need to modify these values later ( current range was from 0 to infinity )
    /// @dev Full range ticks (safe default)
    int24 internal constant MIN_TICK = -887220;
    int24 internal constant MAX_TICK = 887220;

    // ===== CertsDemo =====

    /// @dev Initial supply of CertsDemo (5,000,000 CERTs)
    uint256 internal constant CERTSDEMO_INITIAL_SUPPLY = 5_000_000 ether;

    // ===== Liquidity params =====
    // 10% of total supply → 500,000 CERTs
    uint256 internal constant CERTS_LP_AMOUNT = 500_000 ether;
    // $25,000 USDC (6 decimals) → initial price = $0.10
    uint256 internal constant USDC_LP_AMOUNT = 50_000 * 1e6;

    // ===== Price config =====

    // Target price: 1 CERTS = $0.10
    // Expressed in USDC smallest units (6 decimals)
    uint256 internal constant PRICE_USDC_PER_CERTS = (USDC_LP_AMOUNT * 1e18) / CERTS_LP_AMOUNT; // 0.10 * 1e6

    // Token decimals
    uint8 internal constant CERTS_DECIMALS = 18;
    uint8 internal constant USDC_DECIMALS = 6;
}
