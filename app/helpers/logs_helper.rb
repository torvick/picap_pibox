module LogsHelper
    
    def get_type(args)
        case args
        when 0
            "Creation"
        when 1
            "List All"
        when 2
            "List One"
        end
    end

    def get_code_response(arg)
        case arg
        when 200
            'The request worked as planned.'
        when 204
            'The request worked without response content.'
        when 404
            'Request endpoint not found.'
        when 422
            'We couldn’t process your request, check the parameters.'
        when 500
            'Internal server error, we had a problem processing the request.'
        else
            'Unknown error'
        end
    end
end
