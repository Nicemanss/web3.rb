module Web3
  module Hpb

    class HpbModule

      include Web3::Hpb::Utility

      PREFIX = 'hpb_'

      def initialize web3_rpc
        @web3_rpc = web3_rpc
      end

      def newAccount password
        @web3_rpc.request("personal_#{__method__}", [password])
      end
      
      def version
        @web3_rpc.request("net_#{__method__}")
      end

      def listening
        @web3_rpc.request("net_#{__method__}")
      end

      def peerCount
        @web3_rpc.request("net_#{__method__}")
      end
      
      def getBalance address, block = 'latest', convert_to_hpb = true
        wei = @web3_rpc.request("#{PREFIX}#{__method__}", [address, block]).to_i 16
        convert_to_hpb ? wei_to_hpb(wei) : wei
      end

      def blockNumber
        from_hex @web3_rpc.request("#{PREFIX}#{__method__}")
      end
      
      def syncing
        @web3_rpc.request("#{PREFIX}#{__method__}")
      end
      
      def mining
        @web3_rpc.request("#{PREFIX}#{__method__}")
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
