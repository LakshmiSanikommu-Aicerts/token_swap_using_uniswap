include .env
export

NETWORK_RPC := $(SEPOLIA_RPC)
SCRIPT := script/DeployV3.s.sol
BUY_SCRIPT := script/Buy.s.sol
SELL_SCRIPT := script/Sell.s.sol
SCRIPT_PANCAKE := script/DeployPancakeSwap.s

deploy:
	forge script $(SCRIPT) \
		--rpc-url $(NETWORK_RPC) \
		--broadcast \
		--verify \
		--private-key $(PRIVATE_KEY) \
		-vvvv

deploy-pancake:
	forge script $(SCRIPT_PANCAKE) \
		--rpc-url $(NETWORK_RPC) \
		--broadcast \
		--verify \
		--private-key $(PRIVATE_KEY) \
		-vvvv

buy:
	forge script $(BUY_SCRIPT) \
		--rpc-url $(NETWORK_RPC) \
		--broadcast \
		--private-key $(PRIVATE_KEY) \
		-vvvv

sell:
	forge script $(SELL_SCRIPT) \
		--rpc-url $(NETWORK_RPC) \
		--broadcast \
		--private-key $(PRIVATE_KEY) \
		-vvvv

deploy-usdt:
	forge script script/DeployUSDT.s.sol \
		--rpc-url $(SEPOLIA_RPC) \
		--broadcast \
		--verify \
		--private-key $(PRIVATE_KEY)

buy-usdt:
	forge script script/BuyUSDT.s.sol \
		--rpc-url $(SEPOLIA_RPC) \
		--broadcast \
		--private-key $(PRIVATE_KEY)

sell-usdt:
	forge script script/SellUSDT.s.sol \
		--rpc-url $(SEPOLIA_RPC) \
		--broadcast \
		--private-key $(PRIVATE_KEY)



