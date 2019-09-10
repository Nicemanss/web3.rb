module Web3
  module Net

    class NetModule

      include Web3::Net::Utility

      PREFIX = 'net_'

      def initialize web3_rpc
        @web3_rpc = web3_rpc
      end

      def version
        from_hex @web3_rpc.request("#{PREFIX}#{__method__}")
      end

      def listening
        from_hex @web3_rpc.request("#{PREFIX}#{__method__}")
      end

      def peerCount
        from_hex @web3_rpc.request("#{PREFIX}#{__method__}")
      end

      def method_missing m, *args
        @web3_rpc.request "#{PREFIX}#{m}", args[0]
      end


    end
  end
end
