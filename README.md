# Web3 RPC client for High Performance Blockchain Node

This Ruby Gem is used to connect and communicate with a High Performance Blockchain node using the RPC interface.


## Installation
```bash
# git clone https://github.com/Nicemanss/web3.rb
# cd web3.rb
# bin/setup

To install this gem onto your local machine, run:
# bundle exec rake install

To test the installation, run:
# ruby example.rb

You can also run the following command for an interactive prompt that will allow you to experiment:
# bin/console
```


## Usage

https://github.com/Nicemanss/web3.rb/blob/master/example.rb is a basic example that could get you started.

### Connect

Connecting to local node ( or by SSH Tunnel )

```ruby
web3 = Web3::Hpb::Rpc.new
```

If you need to connect to remote host, you can specify host, port and HTTP connection options:

```ruby
web3 = Web3::Hpb::Rpc.new host: 'node.myhpbwallet.com', 
                          port: 443,  
                          connect_options: { use_ssl: true, open_timeout: 20, read_timeout: 120 } 
```

HTTP connection options are from  [Ruby HTTP](https://ruby-doc.org/stdlib-2.4.2/libdoc/net/http/rdoc/Net/HTTP.html)  plus additional optional property
**rpc_path** - path to RPC interface.


### Calling HPB interface

```
>> web3.hpb.blockNumber
4376369

>> web3.hpb.getBalance '0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c'
3916.6597314456685

>> block = web3.hpb.getBlockByNumber 12345
#<Web3::Hpb::Block:0x.... @block_data={"author"=>"0x...", ...

>> block.timestamp_time
2017-10-17 12:51:36 +0300

>> block.transactions.count
129

>> block.transactions[0].from
"0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c"

>> block.transactions[0].value_hpb
0.51896811

```


### Accesing contract methods

```
# creation of contract object
myContract = web3.hpb.contract(abi);

# initiate contract for an address
myContractInstance = myContract.at('0xa1960fa87733f1b9ffbfb95d9d692471aa691c9c');

# call constant function
result = myContractInstance.balanceOf('0x...'); # any constant method works
puts result 
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

