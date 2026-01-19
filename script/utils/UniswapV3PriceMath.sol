// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library UniswapV3PriceMath {
    function sqrt(uint256 x) internal pure returns (uint256 y) {
        if (x == 0) return 0;
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }

function computeSqrtPriceX96(
    bool certsIsToken0,
    uint256 priceUsdcPerCerts, // 0.10 * 1e6
    uint8 certsDecimals,
    uint8 /* usdcDecimals */
) internal pure returns (uint160) {
    uint256 numerator;
    uint256 denominator;

    if (certsIsToken0) {
        // token0 = CERTS, token1 = USDC
        // price = USDC / CERTS
        numerator   = priceUsdcPerCerts;
        denominator = 10 ** certsDecimals;
    } else {
        // token0 = USDC, token1 = CERTS
        // price = CERTS / USDC (reciprocal)
        numerator   = 10 ** certsDecimals;
        denominator = priceUsdcPerCerts;
    }

    uint256 ratioX192 = (numerator << 192) / denominator;
    return uint160(sqrt(ratioX192));
}

}
