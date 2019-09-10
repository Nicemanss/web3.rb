module Web3
  module Hpb

    class HpbModule

      include Web3::Hpb::Utility

      PREFIX = 'hpb_'

      def initialize web3_rpc
        @web3_rpc = web3_rpc
      end

      def newAccount password
        resp = @web3_rpc.request("personal_#{__method__}", [password])
      end
      
      def version
        resp = @web3_rpc.request("net_#{__method__}")
      end

      def listening
        resp = @web3_rpc.request("net_#{__method__}")
      end

      def peerCount
        resp = @web3_rpc.request("net_#{__method__}")
      end
      
      def getBalance address, block = 'latest', convert_to_hpb = true
        wei = @web3_rpc.request("#{PREFIX}#{__method__}", [address, block]).to_i 16
        convert_to_hpb ? wei_to_hpb(wei) : wei
      end

      def getBlockByNumber block, full = true, convert_to_object = true
        resp = @web3_rpc.request("#{PREFIX}#{__method__}", [hex(block), full])
        convert_to_object ? Block.new(resp) : resp
      end

      def blockNumber
        from_hex @web3_rpc.request("#{PREFIX}#{__method__}")
      end
      
      def syncing
        resp = @web3_rpc.request("#{PREFIX}#{__method__}")
      end

      def getTransactionByHash tx_hash
        Transaction.new @web3_rpc.request("#{PREFIX}#{__method__}", [tx_hash])
      end

      def getTransactionReceipt tx_hash
        TransactionReceipt.new @web3_rpc.request("#{PREFIX}#{__method__}", [tx_hash])
      end

      def contract abi
        Web3::Hpb::Contract.new abi, @web3_rpc
      end

      def method_missing m, *args
        @web3_rpc.request "#{PREFIX}#{m}", args[0]
      end


    end
  end
end
