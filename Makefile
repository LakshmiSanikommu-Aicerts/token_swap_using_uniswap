include .env
export

NETWORK_RPC := $(SEPOLIA_RPC)
SCRIPT := script/Deploy.s.sol
BUY_SCRIPT := script/Buy.s.sol
SELL_SCRIPT := script/Sell.s.sol

deploy:
	forge script $(SCRIPT) \
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

