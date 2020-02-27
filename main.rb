puts "Bem-vindo ao jogo da adivinhacao"
puts "Qual e o seu nome?"
nome = gets
puts "\n\n\n\n"
puts "Comecaremos o jogo para voce, " + nome
puts "Escolhendo um numero secreto entre 0 e 200..."
numero_secreto = 121
puts "Escolhido... que tal adivinhar hoje o nosso numero secreto?"
puts "\n\n\n"
$tentativas = 1

def pergunta!(numero_secreto)
  chute = 0
  if numero_secreto != chute.to_i
    puts "Tentativa " + $tentativas.to_s
    $tentativas = $tentativas + 1
    puts "Entre com o numero"
    chute = gets
    puts "Sera que acertou? Voce chutou " + chute
    puts numero_secreto == chute.to_i
  end
  if numero_secreto == chute.to_i
    puts "você acertou parabens"
  elsif numero_secreto > chute.to_i
    puts "você chutou um valor menor que o numero secreto"
  else
    puts "você chutou um valor maior que o numero secreto"
  end
  puts "\n\n\n"
end

3.times do
    pergunta!(numero_secreto)
  end