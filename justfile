set dotenv-load

run-script script_name flags='' sig='' args='':
  sh -c 'FOUNDRY_PROFILE=ci forge script script/{{script_name}}.s.sol {{sig}} {{args}} \
    --rpc-url $SCRIPT_RPC_URL \
    --private-key $SCRIPT_PRIVATE_KEY \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --verifier-url $VERIFIER_URL \
    -vvvv {{flags}}' 

deploy:
  sh -c 'just run-script "CounterScript" "--broadcast --verify --slow"' 
verify:
  sh -c 'just run-script "CounterScript" "--verify"'

