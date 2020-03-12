def da_boas_vindas
  puts "Bem-vindo ao jogo da adivinhacao"
  puts "Qual e o seu nome?"
  nome = gets
  puts "\n\n\n\n"
  puts "Comecaremos o jogo para voce, #{nome}"
end

def pede_dificuldade
  puts "Qual o nivel de dificuldade que deseja? (1 facil, 5 dificil) "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto (dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end

  puts "Escolhendo um numero secreto entre 0 e #{maximo}..."
  numero_secreto = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje o nosso numero secreto?"

  numero_secreto
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "\n\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes ate agora #{chutes}"
  puts "Entre com o numero"
  chute = gets.strip.to_i
  loop do
    break unless chutes.include? chute
    puts "Atencao, voce ja jogou o numero #{chute}!"
    chute = gets.strip.to_i
  end
  puts "Sera que acertou? Voce chutou #{chute}"
  chute
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute
  if acertou
    puts "Acertou!"
    return true
  else
    maior = numero_secreto > chute
    if maior
      puts "O numero secreto e maior!"
    else
      puts "O numero secreto e menor!"
    end
    false
  end
end

def joga(limite_de_tentativas, dificuldade)
  chutes = []
  numero_secreto = sorteia_numero_secreto dificuldade
  (1..limite_de_tentativas).each do |tentativa|
    chute = pede_um_numero chutes, tentativa, limite_de_tentativas
    chutes << chute
    break if verifica_se_acertou numero_secreto, chute
  end
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip.upcase
  quero_jogar.casecmp("N").zero?
end

da_boas_vindas
limite_de_tentativas = 3
dificuldade = pede_dificuldade
loop do
  joga limite_de_tentativas, dificuldade
  break if nao_quer_jogar?
end