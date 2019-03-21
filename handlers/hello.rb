module Lita
  module Handlers
    class Hello < Handler
      route(/oi/, :hello, command: true, help: { hello: "responde uma mensagem motivacional." })

      MESSAGES = [
        'Bom dia galera!',
        'Goodie Goodie Morning pessoal!',
        'Que esse dia seja produtivo e delicioso! Bom dia amigos!',
        'Bom dia... e alegria... vamos sorrir e cantar! Dia galera!',
        'DIAAAAAAAAA',
        'Bão dia fi!',
        'Bom Bom Bom Bom diaaaaaaaaaa!',
        'Woof Woof! Bom dia!',
        'Good morning america!',
        "A quem chega, bom dia! Let's get to work!",
        "Let's do it to it, pessoal! Bom Dia!",
        'Bundinha! Quer dizer... Bom dia!',
        'Dia rapeizee!',
        'Dia dia dia diiiiaaa!',
        'Mais um dia começando, que esse seja ótimo galera!',
        'Vai dar certo, mah!',
        'Bom dia, rapaziada!'
      ].freeze

      def hello(response)
        response.reply(MESSAGES.sample)
      end

      Lita.register_handler(self)
    end
  end
end
