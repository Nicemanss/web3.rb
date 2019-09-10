module Web3
  module Hpb
    module Net
      
      class NetModule

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
end
