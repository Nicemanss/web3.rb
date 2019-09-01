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
print 'Connected to node: ', node,"\n"
print 'Blocknumber: ', web3.hpb.blockNumber,"\n"
print "Account: ",account,"\n"
print "Balance: ",web3.hpb.getBalance(account)," HPB\n"