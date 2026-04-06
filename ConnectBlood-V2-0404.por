programa {

  inclua biblioteca Util --> u

  funcao letreiroPrograma() {    
    escreva("##################################################\n")
    escreva("########          CONNECT BLOOD           ########\n")
    escreva("##################################################\n")
  }

  funcao menuLogin() {
    letreiroPrograma() 
    escreva("\n         ####### OPÇÕES DE LOGIN #######\n")
    escreva("         ####  1 - DOADOR           ####\n")
    escreva("         ####  2 - ADMINISTRADOR    ####\n")
    escreva("         ####  3 - SAIR             ####\n")
    escreva("         ###############################\n")
  }


  funcao menuDoador() {
    letreiroPrograma()
    escreva("\n       ######### OPÇÕES DE DOADOR #########\n")
    escreva("       ####  1 - AGENDAMENTO           ####\n")
    escreva("       ####  2 - ATUALIZAR CADASTRO    ####\n")
    escreva("       ####  3 - VOLTAR                ####\n")
    escreva("       ####################################\n")
    }
 
   funcao menuAdmin() {
    letreiroPrograma() 
    escreva("\n        ###### OPÇÕES ADMINISTRADOR ######\n")
    escreva("        ####  1 - CADASTRAR BANCO     ####\n")
    escreva("        ####  2 - LISTAR BANCOS       ####\n")
    escreva("        ####  3 - LISTAR DOADORES     ####\n")
    escreva("        ####  4 - VOLTAR              ####\n")
    escreva("        ##################################\n")
  }

  funcao alerta(){
    escreva("\n ####################################################################\n")
    escreva(" ###    CARO DOADOR, LEMBRAMOS QUE ESSAS PERGUNTAS DEVEM SER      ###\n")
    escreva(" ###    REPONDIDAS COM SINCERIDADE E RESPONDABILIDADE!            ###\n")
    escreva(" ###    TODAS AS INFORMAÇÕES DEVEM SER VERDADEIRAS, SOB RISCO     ###\n")
    escreva(" ###    DE RESPONSABILIZAÇÃO NOS TERMOS DA LEGISLAÇÃO VIGENTE.    ###")
    escreva("\n ####################################################################\n")
  }

  funcao menuAgendamento() {
    letreiroPrograma()
    escreva("\n  ########## OPÇÕES DE AGENDAMENTO ###########\n")
    escreva("  ####  1 - SELECIONE UM BANCO DE SANGUE  ####\n")
    escreva("  ####  2 - DICAS PARA O DIA DA DOAÇÃO    ####\n")
    escreva("  ####  3 - VOLTAR                        ####\n")
    escreva("  ############################################\n")
  }

  funcao dicas(){
    letreiroPrograma()
    escreva("\n  ###########################################################\n")
    escreva("  ####  1- Leve um documento oficial com foto.           ####\n")
    escreva("  ####  2- Esteja bem alimentado(a), não doe em jejum    ####\n")
    escreva("  ####  3- Use roupas confortávies                       ####\n")
    escreva("  ####  4- Durma pelo menos 6 horas na noite anterior    ####\n")
    escreva("  ####  5- Evite bebidas alcoólicas por 12 horas antes   ####\n")
    escreva("  ####  6- Não fume por pelo menos 2 horas antes         ####")
    escreva("\n  ###########################################################\n")
  }

  funcao inteiro recebeCodigo(inteiro maiorOpcao) {
    inteiro codigo
    escreva("\nDigite sua opção: ")
    leia(codigo)
    enquanto(codigo < 1 ou codigo > maiorOpcao) {
      escreva("\n           !!! Código Inválido !!!\n")
      menuLogin()
      escreva("\nDigite sua opção: ")
      leia(codigo)
    }
    retorne codigo
  }

  funcao listaBancos() {
    se (proximoBanco == 0) {
      escreva("\n-- Não há bancos cadastrados --\n")
    } senao {
      escreva("\nLISTA DE BANCOS DE SANGUE CADASTRADOS:\n")
      para (inteiro i = 0 ; i < proximoBanco ; i++) {
        escreva("\n############## - ", i + 1 , " - ##############")
        escreva("\nNome: ", bancos[i][0])
        escreva("\nEndereço: ", bancos[i][1])
        escreva("\nAtendimento: ", bancos[i][2])
        escreva("\nTelefone: ", bancos[i][3])
        escreva("\nEmail: ", bancos[i][4], "\n")
      }
    }
    escreva("\ntecle enter para voltar ao menu")
    leia(dummy) 
  }

  // declaração das variáveis globais
  cadeia bancos[5][5]  // o "banco de dados" de bancos de sangue. Estou determinando que serão 5 vetores, cada um com 5 posições
  inteiro proximoBanco = 0
  inteiro codigoMenuPrincipal
  inteiro codigoMenuInterno
  logico impedido = falso
  cadeia dummy // variável 'dummy', só para que o leia() provoque a parada do programa
  
  funcao inicio() {
    
    menuLogin()

    codigoMenuPrincipal = recebeCodigo(3)

    enquanto(codigoMenuPrincipal != 3) {

      escolha(codigoMenuPrincipal) {
        caso 1: // DORADOR

          limpa()
          
          menuDoador()
          
          codigoMenuInterno = recebeCodigo(3)
          
          escolha(codigoMenuInterno){
            caso(1): 

              caracter pre_triagem[12]  //Esse questionário serve para excluir individuos que seriam exluído na entrevista de triagem clínica
                  
              limpa()
              alerta()
              escreva("\ntecle enter para iniciar o questinário")
              leia(dummy) 
              limpa()
              letreiroPrograma()
              escreva("\nUse S para sim e N para não.\n")
              escreva("\n1- Você tem menos de 16 anos?\n")
              leia(pre_triagem[0])
              escreva("2- Você tem mais de 69 anos?\n")
              leia(pre_triagem[1])
              escreva("3- Você pesa menos de 50 kg?\n")
              leia(pre_triagem[2])
              escreva("4- Você fez algum procedimento cirúrgico nos últimos 6 meses?\n")
              leia(pre_triagem[3])
              escreva("5- Você fez tatuagem, colocou piercing ou brinco no último ano?\n")
              leia(pre_triagem[4])
              escreva("6- Você tem hepatite, AIDS, Doença de Chagas, malária ou HTLV?\n")
              leia(pre_triagem[5])
              limpa()
              letreiroPrograma()
              escreva("\n7- Você faz uso de drogas ilícitas injetávies?\n")
              leia(pre_triagem[6])
              escreva("8- Você tem problemas cardiácos?\n")
              leia(pre_triagem[7])
              escreva("9- Você teve diagnóstico ou suspeta de Covid-19 nos últimos 10 dias?\n")
              leia(pre_triagem[8])
              escreva("10- Você teve contato com pessoas com diagnóstico de Covid-19 nos últimos 7 dias?\n")
              leia(pre_triagem[9])
              escreva("11- Você fez alguma dessas vacinas nas últimas 48 horas (Covaxin/coronavac/Butatan) para Covid-19 ou gripe?\n")
              leia(pre_triagem[10])
              escreva("12- Você fez alguma dessas outras vacinas para Covid-19 nos últimos 7 dias (Astrazeneca/Oxford?fiocruz/Sputinik V/Janssen/Pfizer)?\n")
              leia(pre_triagem[11])
          
              para(inteiro i = 0; i < 12; i++) {
                se (pre_triagem[i] == 's' ou pre_triagem[i] == 'S') {
                  impedido = verdadeiro
                  pare
                }
              }

              se (impedido) { 
                escreva("\nInfelizmente, no momento, você não cumpre os requisitos para efetuar a doação.\n")
                escreva("\nLigue para o banco de sangue e saiba mais informações.\n")
                u.aguarde(1000)
              } senao {
                u.aguarde(500)
                escreva("\nVocê será direcionado ao agendamento.\n")
                u.aguarde(2000)

                limpa()
                menuAgendamento()

                codigoMenuInterno = recebeCodigo(3)

                escolha(codigoMenuInterno){
                  caso(1): // LISTAR BANCOS
                    listaBancos()
                  pare

                  caso(2):
                    limpa()
                    dicas()
                    u.aguarde(3500)
                    limpa()
                  pare
                }
              }
              pare

            caso (2): // ATUALIZAR CADASTRO DOADOR
              // será implementado numa próxima versão
            pare            
          }
          
          pare

        caso 2: // ADMINISTRADOR
          limpa()
          menuAdmin()
          codigoMenuInterno = recebeCodigo(4)
          enquanto(codigoMenuInterno != 4) {  // enquanto de nível 2 dentro do caso 2 de nivel 1
            escolha(codigoMenuInterno) {  // escolha caso de nível 2 dentro do caso 2 de nivel 1
              caso 1:  // CADASTRAR BANCO
                se (proximoBanco < 5) {  // verifica se as 5 posições já estão coupadas
                  escreva("Nome do Banco de Sange: ")
                  leia(bancos[proximoBanco][0])  // a variável proximoBanco, que começa com zero, representa o número da posição do vetor externo
                  escreva("Endereço: ")
                  leia(bancos[proximoBanco][1])
                  escreva("Horário de atendimento: ")
                  leia(bancos[proximoBanco][2])
                  escreva("Email de contato: ")
                  leia(bancos[proximoBanco][3])
                  escreva("Telefone de contato: ")
                  leia(bancos[proximoBanco][4])
                  proximoBanco++  // incremento para passar para a posição seguinte

                  u.aguarde(500)  // função que gera um pequeno delay. Recebe milisegundos, ou seja, 2000 são 2 segundos
                  escreva("\nBanco de Sangue cadastrado com sucesso!\n")
                  u.aguarde(500)

                } senao {
                  escreva("\n!!! Sem espaço na base de dados !!!\n")  // se as 5 posições estiverem tomadas (posições de 0 a 4) e a variável proximoBanco estiver com valor 5.
                }

                escreva("\ntecle enter para voltar ao menu")
                leia(dummy)        

                pare
              caso 2: // LISTAR BANCOS
                listaBancos()
                pare

              caso 3: // LISTAR DOADORES
                // Será implementado numa próxima versão
                pare

            }

            limpa()
            menuAdmin()
            codigoMenuInterno = recebeCodigo(4)

          } 
          pare

      }

      u.aguarde(500)
      escreva("\nRetornando ao Menu Principal")
      u.aguarde(2000)
      limpa()
      menuLogin()
      codigoMenuPrincipal = recebeCodigo(3)

    } 

  u.aguarde(500)
  escreva("\nFim da execução\n")
  u.aguarde(1000)
  escreva("\nObrigado, nos vemos em breve!!!\n")

  }
}
