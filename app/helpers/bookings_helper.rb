module BookingsHelper
    def get_one_pack_sizes(args)
        case args
        when 0	
            'Very small	Documents, keys, etc	N/A'
        when 1	
            'Small	20x20x20cm	8,000 cm^3'
        when 2	
            'Medium	30x30x30xcm	27,000 cm^3'
        when 3	
            'Big	50x50x50cm	125,000 cm^3'
        end
    end

    def status_order(args)
        case args
        when 0	
            'Looking for driver'
        when 1	
            'Drive en route'
        when 5	
            'Picking up package'
        when 6	
            'Package on board'
        when 7	
            'Delivering package'
        when 4	
            'Finished successfully'
        when 100	
            'Canceled by driver'
        when 102	
            'Canceled by passenger'
        when 101	
            'Expired, no driver found'
        when 109	
            'Scheduled'
        end
    end

    def status_package(args)
        case args
        when 0	
            'Waiting for pickup'
        when 1	
            'Picked up'
        when 2	
            'Delivered'
        when 3	
            'Canceled'
        when 4	
            'Not received'
        when 5	
            'Returned'
        when 6	
            'In storage'
        end
    end

    def package_not_picked_up_reasons_substatus(args)
        case args
        when 0	
            'Product not available'
        when 1	
            'Wrong address'
        when 2	
            'Closed'
        end
    end

    def package_not_received_reasons_substatus(args)
        case args
        when 0	
            'None'
        when 1	
            'Wrong address'
        when 2	
            'Rejected by client'
        when 3	
            'Missing client'
        when 4	
            'Client does not have money'
        end
    end
end
