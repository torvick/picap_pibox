class ApiPicap
    include HTTParty
    debug_output $stdout
    base_uri Rails.application.credentials.dig(:picap, :url)
    headers 'Content-Type' => 'application/json'

    # Crear un pedido
    # Este servicio crea un nuevo pedido con un listado de paquetes a ser entregados en un grupo de paradas especificadas por el usuario.

    def self.post_bookings(args)
        response = self.post('/bookings', query: {
            t: Rails.application.credentials.dig(:picap, :token)
        },
        body: args.to_json
        )
        set_logs(response, 0)
        response.parsed_response 
    end

    # Detalle de un pedido
    # Este servicio retorna el detalle de un pedido donde se especifica la información mas relevante de este.

    def self.get_booking(arg)
        response = self.get("/bookings/#{arg}", query: {
            t: Rails.application.credentials.dig(:picap, :token)
        })
        set_logs(response, 2)
        response.parsed_response
    end

    # Listar todos mis pedidos
    # Este servicio lista todos los pedidos de un usuario de forma paginada. Por medio de parámetros query es posible filtrar el listado por estado para lograr una búsqueda detallada en caso de ser necesario.
    
    def self.get_bookings
        response = self.get('/bookings', query: {
            t: Rails.application.credentials.dig(:picap, :token)
        })
        set_logs(response, 1)
        response.parsed_response
    end

    private

    # Guarda los response de las peticiones
    # Este metodo se encarga de crear y almacenar registros de log para las respuestas HTTP de la aplicación.

    def self.set_logs(response, type)
        log = Log.new(response: response.parsed_response, type_response: type)
        response.code > 199 && response.code < 300 ? log.success = true : log.success = false
        log.code = response.code
        log.save
    end

  end
  