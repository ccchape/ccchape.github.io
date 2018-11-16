require 'open-uri'
require 'json'

def values(fake=false)
  sheet = "1GB5UEw9E3xEQoVU__K8QwPF4EbpsAkqUqxfd0LfmJio"
  token = open("TOKEN", 'r').read
  range = "Respostas!A%3AG"
  uri = 'https://sheets.googleapis.com/v4/spreadsheets/%s/values/%s?key=%s' % [sheet, range, token]

  data = nil
  if !fake
    data = open(uri).read { |f| f.read }
  else
    data = '{
      "range": "Respostas!A1:G102",
      "majorDimension": "ROWS",
      "values": [
        [
          "Carimbo de data/hora",
          "Nome para exibição no ranking",
          "Ano que ingressou, ou pretende ingressar na faculdade (importante para definir a categoria)",
          "handle do Codeforces (necessário para calcular a sua posição no ranking):",
          "Instituição de ensino atual",
          "Login do Telegram (para adicionarmos você no nosso grupo)",
          "Endereço de e-mail"
        ],
        [
          "15/11/2018 16:47:45",
          "Emilio Wuerges",
          "2002",
          "wuerges",
          "UFFS",
          "@wuerges",
          "wuerges@gmail.com"
        ]
      ]
    }'
  end

  result = JSON.parse(data)["values"]
  result.shift
  result
end
