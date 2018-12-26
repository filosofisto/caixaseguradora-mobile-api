# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
CategoryProperty.create(
  [
      {name: 'É usado como república, pensão ou albergue'},
      {name: 'É uma casa de madeira'},
      {name: 'É tombado pelo patrimônio histórico'},
      {name: 'Está localizado na área rural'},
      {name: 'Está em construção ou reforma'},
      {name: 'Não se encaixa em nenhum desses casos'},
  ]
)

Coverage.create(
  [
      {
          name: 'Incêncio, queda de raio e explosão', value: 90.0, franchise: 800.0, fix: true,
          description: 'Se ocorrer um incêndio de qualquer natureza no imóvel, se um raio cair no terreno do imóvel ou uma explosão de qualquer natureza começar dentro da área de seu terreno, você poderá receber até 100% do valor dessa cobertura para reparar danos causados ao imóvel e aos seus bens.'
      },
      {
          name: 'Impacto de veículos terrestres e queda de aeronaves', value: 0.0, franchise: 0.0, fix: true,
          description: 'Cobre perdas e danos causados ao imóvel e outros bens pela colisão de veículos terrestres ou queda de aeronaves, inclusive incêndio e explosão causados por eles.'
      },
      {
          name: 'Vendaval, granizo, fumaça, furacão, ciclone e tornado ', value: 10000.0, franchise: 300.0, fix: true,
          description: 'Garante o pagamento das perdas e danos causados diretamente por um desses eventos ou por incêndio e explosão consequentes dessas mesmas situações. Franquia 10% dos prejuízos indenizáveis, com mínimo de R$ 300,00.'
      },
      {
          name: 'Danos elétricos', value: 5000.0, franchise: 200.0, fix: true,
          description: 'Essa cobertura garante o pagamento das perdas e danos causados por curto-circuito, descarga elétrica e outros danos causados por variações anormais de tensão. Franquia 10% dos prejuízos indenizáveis, com mínimo de R$ 200,00'
      },
      {
          name: 'Furto, extorsão e roubo ', value: 6000.0, franchise: 0.0, fix: true,
          description: 'Em caso de roubo, furto ou extorsão, essa cobertura garante o pagamento dos bens levados ou danificados e dos danos causados ao imóvel. Mas, essa cobertura só pode ser contratada para sua moradia permanente.'
      },
      {
          name: 'Roubo e furto de equipamentos portáteis', value: 2000.0, franchise: 0.0, fix: true,
          description: 'Caso seus bens cinematográficos, fotográficos e computadores portáteis sejam roubados, por meio do uso de força física ou arrombamento do imóvel, você recebe uma indenização de até o valor contratado.'
      },
      {
          name: 'Impacto de veículos e queda de aeronaves', value: 7500.0, franchise: 200.0, fix: false,
          description: 'Cobre perdas e danos causados ao imóvel e outros bens pela colisão de veículos terrestres ou queda de aeronaves, inclusive incêndio e explosão causados por eles.'
      },
      {
          name: 'Perda ou pagamento de aluguel', value: 10000.0, franchise: 0.0, fix: false,
          description: 'Se o imóvel que você aluga sofrer danos por incêndio, explosão ou raio, a seguradora paga ao proprietário o valor do aluguel para que você possa alugar outro lugar para morar. Assim, ninguém fica no prejuízo até que você possa voltar para casa.'
      },
      {
          name: 'Quebra de vidros, blindex, espelhos, mármore e granito', value: 5000.0, franchise: 70.0, fix: false,
          description: 'Não importa se foi espontaneamente, por imprudência ou por causa da chuva, essa cobertura cobre perdas e danos gerados pela quebra de vidros, espelhos, blindex, mármores e granito.'
      },
      {
          name: 'Responsabilidade civil familiar', value: 25000.0, franchise: 0.0, fix: false,
          description: 'Caso aconteça algum dano a outra pessoa em que você for responsabilizado civilmente, essa cobertura cobre as despesas de reparo desse prejuízo. Por exemplo: se o seu filho quebrar acidentalmente a janela do vizinho, o seguro paga as despesas.'
      },
      {
          name: 'Prejuízos causados por tumultos e greves', value: 7500.0, franchise: 0.0, fix: false,
          description: 'Cobre prejuízos causados ao seu imóvel por manifestações, protestos, aglomerações e lock-out.'
      }
  ]
)

Assistance.create(
    [
        {
            name: 'Chaveiro', limit_use: 1, included: true,
            description: 'Se a porta for arrombada, a casa for assaltada ou simplesmente você perder ou quebrar as chaves da porta de acesso, a gente manda alguém até você.'
        },
        {
            name: 'Hidráulica', limit_use: 1, included: true,
            description: 'Conte com serviços de hidráulica em casos de emergência ou sinistro para reparar vazamento interno que cause ou possa causar um alagamento.'
        },
        {
            name: 'Vidraceiro', limit_use: 1, included: true,
            description: 'Em caso de emergência, (quebra de vidros em portas ou janelas externas) enviamos o vidraceiro ou colocamos tapume no caso de não ser possível a execução do serviço.'
        },
        {
            name: 'Eletricista', limit_use: 1, included: true,
            description: 'A gente envia eletricista para reparar o que for necessário para restabelecer a energia elétrica ou solucionar problemas elétricos, dependendo do evento ocorrido.'
        },
        {
            name: 'Cobertura provisória de telhados', limit_use: 1, included: true,
            description: 'Em caso de emergência, enviamos um profissional para realizar a cobertura provisória do telhado com lona ou plástico.'
        },
        {
            name: 'Desentupimento', limit_use: 1, included: true,
            description: 'Se precisar, enviamos um profissional para desentupir a tubulação de esgoto ou da caixa de gordura.'
        },
        {
            name: 'Vistoria de imóvel para combater a dengue', limit_use: 1, included: false,
            description: 'Quando necessário, enviamos um profissional para inspecionar e avaliar as áreas internas e externas do imóvel.'
        },
        {
            name: ' Assistência tv, vídeo e som', limit_use: 1, included: false,
            description: 'Essa assistência oferece profissionais para o consertar equipamentos como TV, Vídeo Cassete, Blu-ray, DVD, Aparelho de Som e Home-Theater.'
        },
        {
            name: 'Assistência fogão, geladeira, lavadora', limit_use: 1, included: false,
            description: 'Aproveite essa assistência para consertar equipamentos, como fogão, cooktop, fornos, geladeira, freezer, lavadoras/secadoras de louças ou roupas, tanquinho.'
        },
        {
            name: 'Manutenção residencial', limit_use: 1, included: false,
            description: 'Com essa assistência, você conta com serviço de caçamba e profissionais para revisar a instalação elétrica, verificar vazamentos, instalar olho mágico, lubrificar fechaduras e dobradiças, fixar objetos nas paredes e trocar vidros.'
        },
        {
            name: 'Assistência bike', limit_use: 1, included: false,
            description: 'Para cuidar da sua bike, essa assistência cobre montagem de bicicleta, troca de pneu e corrente, ajuste ou troca dos cabos ou sapatas.'
        },
        {
            name: 'Assistência nutricional', limit_use: 1, included: false,
            description: 'Esse serviço telefônico oferece orientação nutricional por meio de estudantes de graduação em nutrição com supervisão de uma nutricionista para quem busca qualidade de vida e saúde.'
        },
        {
            name: 'Antivirus celular', limit_use: 1, included: false,
            description: 'Use esse serviço para evitar a perda de dados, bloquear e localizar seu smartphone em caso de perda, roubo ou furto. Mesmo longe do aparelho, você poderá apagar arquivos para que outras pessoas não vejam.'
        },
        {
            name: 'Cursos online', limit_use: 1, included: false,
            description: 'Você pode fazer dois cursos online por ano. A lista de cursos estará disponível para você escolher.'
        },
        {
            name: 'Assistência informática', limit_use: 1, included: false,
            description: 'Aproveite os serviços de suporte, diagnóstico e manutenção para resolver problemas emergenciais que impeçam o funcionamento de hardware, software, sistemas ou internet.'
        },
        {
            name: 'Adaptação de imóvel para idosos', limit_use: 1, included: false,
            description: 'Essa assistência oferece a instalação de itens de segurança, troca de pia, torneiras, maçanetas, mudança de móveis e outros serviços que facilitam a vida do morador.'
        },
        {
            name: 'Adaptação de imóvel para crianças', limit_use: 1, included: false,
            description: 'Um profissional irá analisar os cômodos e indicar serviços para deixar sua casa mais segura para crianças. Cobre também a mudança de móveis, intalação de itens de segurança e outros serviços gerais.'
        },
        {
            name: 'Adaptação de imóvel para pessoa com deficiência', limit_use: 1, included: false,
            description: 'Instalação de itens de segurança, rampas,portas, troca de pia, torneiras e outros serviços gerais para facilitar a vida de quem precisa de cuidados especiais.'
        },
        {
            name: 'Orientações veterinárias por telefone', limit_use: 1, included: false,
            description: 'Nessa assistência, você tem atendimento veterinário por telefone com orientações sobre primeiros socorros e situações de baixa complexidade para guiar você nos cuidados com os seus bichinhos de estimação.'
        },
        {
            name: 'Assistência pet (cães e gatos)', limit_use: 1, included: false,
            description: 'Assistência e transporte veterinário emergencial de cães e gatos, consultas na Rede Credenciada TEMPO USS, informações, hospedagem, aplicação de vacinas em casa e outras facilidades.'
        }
    ]
)