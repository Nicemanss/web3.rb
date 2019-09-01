# Web3 RPC client for High Performance Blockchain Node

This Ruby Gem is used to connect and communicate with a High Performance Blockchain node (ghpb) using the RPC interface.

What you can do using this GEM:

  - use Web3 HPB interface methods to read blocks, transactions 
  - parse transaction method calls according to ABI
  - parse transaction logs according to ABI
  - parse contract creation arguments accroding to ABI
  - list internal transaction using parity extended trace JSONRPC API


## Installation
- git clone https://github.com/Nicemanss/web3.rb
- cd web3.rb
- bin/setup

## Example
ruby example.rb


## Usage

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



After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

