# Certs365 Token — ERC-20 + Uniswap Launch Guide

This document describes how the **Certs365 (C365)** token is created, listed, and traded on Uniswap using Foundry and Ethereum Sepolia.

The goal is to create a **real on-chain certificate token economy** where C365 can be bought, sold, and used for certificate issuance.

---

## 1. What is being built

Certs365 is a fixed-supply ERC-20 token that:

- Represents certificate credits
- Has a real market price
- Can be traded on a decentralized exchange (Uniswap)
- Works with MetaMask and all Web3 wallets

This turns certificates into a real economic asset.

---

## 2. Network & Tools

The system uses:

- **Ethereum Sepolia** (testnet)
- **Foundry** for deployment
- **OpenZeppelin** for ERC-20 standard
- **Uniswap V2** for trading
- **MetaMask** for wallet access

---

## 3. Token creation

A Certs365 token is created with:

- Name: **Certs365**
- Symbol: **C365**
- Total Supply: **1,000,000 tokens**

All tokens are initially owned by the project wallet.

---

## 4. Creating the Uniswap market

To make the token tradable, liquidity is added to Uniswap.

The pool is created with:

| Asset | Amount       |
| ----- | ------------ |
| ETH   | 0.01 ETH     |
| C365  | 500,000 C365 |

This creates a **C365 / ETH trading pair** and opens the market.

From this moment:

- Anyone can buy C365 with ETH
- Anyone can sell C365 for ETH
- The token has a live price

---

## 5. How the price is determined

Uniswap uses this formula:

```
Price = ETH in pool ÷ Tokens in pool
```

So:

```
0.01 ETH ÷ 500,000 C365 = 0.00000002 ETH per C365
```

This means:

| Metric | Value           |
| ------ | --------------- |
| 1 C365 | 0.00000002 ETH  |
| 1 ETH  | 50,000,000 C365 |

---

## 6. Price in USDT

Assuming:

```
1 ETH = $3,000
```

Then:

```
1 C365 = 0.00000002 × 3000 = $0.00006
```

So:

| Amount                       | Value    |
| ---------------------------- | -------- |
| 1 C365                       | $0.00006 |
| 1,000 C365                   | $0.06    |
| 100,000 C365                 | $6       |
| 1,000,000 C365 (full supply) | $60      |

This gives Certs365 a **low-cap, utility-focused valuation**, perfect for certificate usage rather than speculation.

---

## 7. How users trade

After liquidity is added:

1. User connects MetaMask to Uniswap
2. User switches to Sepolia network
3. User imports the C365 token
4. User swaps ETH ↔ C365

All trades are:

- On-chain
- Trustless
- Permissionless

---

## 8. Why liquidity matters

Liquidity ensures:

- Prices are visible
- Trades work
- Slippage is reasonable
- The token is not “dead”

By providing **0.01 ETH** and **500,000 C365**, the pool has enough depth for:

- Testing
- Trading
- Certificate credit purchases

---

## 9. What Certs365 gains from this

Certs365 now has:

✔ A real ERC-20 token
✔ A real market price
✔ A Uniswap trading pair
✔ Wallet & DEX compatibility
✔ On-chain economic value

This allows certificates to be:

- Priced
- Bought
- Sold
- Valued
- Verified economically

---

## 10. How this fits Certs365

C365 tokens can be used for:

- Paying for certificate issuance
- Buying verification credits
- Accessing premium features
- On-chain proof of training value

Because the token is tradable, certificates now have **real economic weight**.

---

If you later move this to **Base or Mainnet**, the same model applies — only gas costs and scale change.

Certs365 is now running a **true Web3 certificate economy** 🚀
