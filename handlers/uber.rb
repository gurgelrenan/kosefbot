module Lita
  module Handlers
    class Uber < Handler
      route(/uber/, :uber, command: true, help: { hello: "estima uma viagem." })

      def uber(response)
        client = ::Uber::Client.new(server_token: ENV['UBER_SERVER_TOKEN'])
        slat = ENV['SLAT']
        slon = ENV['SLON']
        dlat = ENV['DLAT']
        dlon = ENV['DLON']

        estimatives = client.price_estimations(start_latitude: slat, start_longitude: slon,
                                                end_latitude: dlat, end_longitude: dlon)

        response.reply('Uber para meu destino')
        estimatives.each do |data|
          response.reply('....................')
          response.reply("Categoria: #{data.display_name}")
          response.reply("Valor estimado: #{data.estimate}")
          response.reply("Multiplicador: #{data.surge_multiplier}")
          response.reply('....................')
        end
      end

      Lita.register_handler(self)
    end
  end
end
