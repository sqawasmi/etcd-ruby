# Encoding: utf-8

require 'json'

module Etcd
  # Support cluster configuration
  module Cluster
    def admin_endpoint
      version_prefix + '/admin'
    end

    # Returns status for all machines in the cluster or for specific machine
    def cluster_status machine = nil
      if machine.nil?
        JSON.parse(api_execute(admin_endpoint + '/machines', :get, :cluster => true).body)
      else
        JSON.parse(api_execute(admin_endpoint + '/machines/' + machine, :get, :cluster => true).body)
      end
    end

    # Returns current cluster config
    def cluster_config
      JSON.parse(api_execute(admin_endpoint + '/config', :get, :cluster => true).body)
    end

    # Remove machine from cluster
    # def remove machine

    # end

  end
end
