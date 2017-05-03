# This is a module to enable find_each/find_in_batches behaviour but with custom
# order criteria
#
# Usage:
#
#   class MyModel < ActiveRecord::Base
#     include OrderedBatcheable
#     # ...
#   end
#
#   MyModel.my_scope.find_each_with_order(order_by: 'purchased_at DESC') do |m|
#     # do stuff with m
#   end
#
module OrderedBatcheable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_each_with_order(order_by: batch_order, batch_size: 1000)
      ids = order(order_by).pluck(primary_key)

      ids.each_slice(batch_size) do |batch_ids|
        where(id: batch_ids).order(order_by).each { |record| yield(record) }
      end
    end
  end
end
