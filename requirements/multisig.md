### How to Create a Multisig Wallet

Gnosis Safe (now Safe{Wallet}) is the go-to for Ethereum-compatible chains (e.g., Mainnet, Polygon, Base) in 2026—it's free to create (just gas fees ~$10-50), supports ERC20, and has modules for vesting/batching. Alternatives like Squads (Solana-focused) exist, but stick to Safe for your ERC20. Here's a step-by-step guide:

1. **Prepare Requirements**:
   - Have 2-5 Ethereum wallets ready (e.g., MetaMask, Ledger). These will be "owners"—include team members or trusted advisors.
   - Fund one wallet with ETH for gas (0.01-0.1 ETH).
   - Decide threshold: e.g., 2-of-3 (needs 2 approvals) for flexibility/security balance.

2. **Go to the Safe App**:
   - Visit app.safe.global (or download the mobile app).
   - Connect your primary wallet (e.g., MetaMask).

3. **Create the Safe**:
   - Click "Create Safe" > Select your chain (Ethereum Mainnet or L2 like Base for lower fees).
   - Add owners: Enter addresses of all signers (yours + team).
   - Set threshold: e.g., 2/3 or 3/5.
   - Name it (e.g., "MyToken Treasury").
   - Review and confirm—pay gas to deploy the smart contract wallet.

4. **Verify & Secure**:
   - Once deployed, verify on Etherscan.
   - Enable 2FA/social recovery; integrate hardware wallets for owners.
   - Test with small transfers before loading allocations.

Costs: Only gas; no ongoing fees. Time: 5-15 minutes. For advanced setups, use Safe's "Modules" for auto-vesting or batch sends. If on another chain, check chain-specific guides (e.g., Safe supports 20+ chains).
