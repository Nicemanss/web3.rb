require 'web3/hpb'

node = "node.myhpbwallet.com"
account = "0xb0617bf785b4ce32a00bdffc7e093ad82c2e0925"
web3 = Web3::Hpb::Rpc.new host: node,
                          port: 443,
                          connect_options: {
                            open_timeout: 20,
                            read_timeout: 140,
                            use_ssl: true
                          }
print "Connected to node: ", node,"\n"
print "Blocknumber: ", web3.hpb.blockNumber,"\n"
print "Account: ",account,"\n"
print "Balance: ",web3.hpb.getBalance(account)," HPB\n"
print "Version: ",web3.hpb.version,"\n"
print "Listening: ",web3.hpb.listening,"\n"
print "Peer Count: ",web3.hpb.peerCount,"\n"
print "Protocol Version: ",web3.hpb.protocolVersion,"\n"
#print "Is Syncing: ",web3.hpb.syncing,"\n"
print "Coinbase: ",web3.hpb.coinbase,"\n"
#print "Mining: ",web3.hpb.mining,"\n"
print "Accounts: ",web3.hpb.accounts,"\n"
print "Created new Account: ",web3.hpb.newAccount('12345678'),"\n"
print "Get Transaction Count: ",web3.hpb.getTransactionCount(["0x407d73d8a49eeb85d32cf465507dd71d507100c1", "latest"]),"\n"
print "Get Transaction Count By Number: ",web3.hpb.getBlockTransactionCountByNumber(["0x3A75D3"]),"\n"
print "Get Transaction Count By Hash: ",web3.hpb.getBlockTransactionCountByHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee"]),"\n"
print "Get Uncle Count By Hash: ",web3.hpb.getUncleCountByBlockHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee"]),"\n"
print "Get Uncle Count By Number: ",web3.hpb.getUncleCountByBlockNumber(["0x3A75D3"]),"\n"
#print(web3.hpb.sendTransaction(),"\n"
print "Get Block: ",web3.hpb.getBlockByNumber(["0x1b4", true]),"\n"
print "Get Block: ",web3.hpb.getBlockByHash(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee", true]),"\n"
print "Get Transaction: ",web3.hpb.getTransactionByBlockHashAndIndex(["0x14e359841aa92a9befa315d866e3f9bbf4ea09662c30538064493f31ebc4ceee", "0x0"]),"\n"
print "Get Transaction: ",web3.hpb.getTransactionByBlockNumberAndIndex(["0x3A75D3", "0x0"]),"\n"
print "Get Transaction: ",web3.hpb.getTransactionReceipt(["0x7f19c141e526066d92331a4ecad637251e8f9d986faf3d79160b16c310c0a86a"]),"\n"
