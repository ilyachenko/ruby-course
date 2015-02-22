# todo - убрать лишние подключения из config.ru
"Set-Cookie"=>"name=edward; path=/"

# Session middleware - сгенерировать токен

require "sequrerandom"
class Session
  @@session = {}
  def inintialize()
  end

  def call(env)
    token = request....
      if ...
          token = generate_token
        @@session[token] = {}
        env['session'] = @@session[token]
      end
      # прокинуть дальше токен в куки
      [c, h.merge("Set-Cookie: " + token + " , path=/"), b]
    @nnext.call(env)
  end

  private
  def generate_token
    SequreRandom.hex
  end

end

# DZ счётчик посещений и последнее время захода


# Вопросы:
# задваивается вызов класса, поэтому подключение в конфиге а не классе
# после строки status, headers, body = @nnext.call(env) идёт вызов класса стор а потом только сессион.мидлваря
