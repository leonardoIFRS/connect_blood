programa {

  inclua biblioteca Util --> u

  // declaração das variáveis globais
  cadeia bancos[5][5]  // o "banco de dados" de bancos de sangue. Estou determinando que serão 5 vetores, cada um com 5 posições
  cadeia doadores[5][2]
  inteiro proximoBanco = 1
  inteiro proximoDoador = 1
  inteiro codigoMenuPrincipal
  inteiro codigoMenuInterno
  logico impedido = falso, respondeuQuestionario = falso  
  cadeia dummy // variável 'dummy', só para que o leia() provoque a parada do programa

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
    escreva("\n      ######### OPÇÕES DE DOADOR #############\n")
    escreva("      ####  1 - QUESTIONÁRIO PRÉ-TRIAGEM  ####\n")
    escreva("      ####  2 - AGENDAMENTO               ####\n")
    escreva("      ####  3 - ATUALIZAR CADASTRO        ####\n")
    escreva("      ####  4 - LISTAR BANCOS DE SANGUE   ####\n")
    escreva("      ####  5 - DICAS - DIA DA DOAÇÃO     ####\n")
    escreva("      ####  6 - VOLTAR                    ####\n")
    escreva("      ########################################\n")
    }
 
   funcao menuAdmin() {
    letreiroPrograma()
    escreva("\n      ###### OPÇÕES ADMINISTRADOR ######\n")
    escreva("      ####  1 - CADASTRAR BANCO     ####\n")
    escreva("      ####  2 - LISTAR BANCOS       ####\n")
    escreva("      ####  3 - LISTAR DOADORES     ####\n")
    escreva("      ####  4 - VOLTAR              ####\n")
    escreva("      ##################################\n")
  }

  funcao alerta(){
    escreva("\n ####################################################################\n")
    escreva(" ###    CARO DOADOR, LEMBRAMOS QUE ESSAS PERGUNTAS DEVEM SER      ###\n")
    escreva(" ###    REPONDIDAS COM SINCERIDADE E RESPONDABILIDADE!            ###\n")
    escreva(" ###    TODAS AS INFORMAÇÕES DEVEM SER VERDADEIRAS, SOB RISCO     ###\n")
    escreva(" ###    DE RESPONSABILIZAÇÃO NOS TERMOS DA LEGISLAÇÃO VIGENTE.    ###")
    escreva("\n ####################################################################\n")
  }

  funcao dicas(){
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
      escreva("\nDigite sua opção: ")
      leia(codigo)
    }
    retorne codigo
  }

  funcao caracter recebeSOuN() {
    caracter resposta
    leia(resposta)
    enquanto(resposta != 's' e resposta != 'S' e resposta != 'n' e resposta != 'N') {
      escreva("Use S para sim e N para não.\n")
      leia(resposta)
    }
    retorne resposta
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

  funcao listaDoadores() {
    se (proximoBanco == 0) {
      escreva("\n-- Não há Doadores cadastrados --\n")
    } senao {
      escreva("\nLISTA DE DOADORES CADASTRADOS:\n")
      para (inteiro i = 0 ; i < proximoDoador ; i++) {
        escreva("\n############## - ", i + 1 , " - ##############")
        escreva("\nNome: ", doadores[i][0])
        escreva("\nCPF: ", doadores[i][1], "\n")
      }
    }
    escreva("\ntecle enter para voltar ao menu")
    leia(dummy) 
  }

  funcao carregaCadastrosIniciais() {
    bancos[0][0] = "Hemocentro"
    bancos[0][1] = "Av Bento Goncalvez 123"
    bancos[0][2] = "das 8h às 17h"
    bancos[0][3] = "51 3333-2222"
    bancos[0][4] = "hemocentro@rs.gov.br"
    doadores[0][0] = "José Nin Guem"
    doadores[0][1] = "00000000191"
  }
  
  funcao inicio() {
    
    carregaCadastrosIniciais()

    menuLogin()

    codigoMenuPrincipal = recebeCodigo(3)

    enquanto(codigoMenuPrincipal != 3) {

      escolha(codigoMenuPrincipal) {
        caso 1: // DORADOR
          limpa()          
          menuDoador()          
          codigoMenuInterno = recebeCodigo(6)          
          enquanto(codigoMenuInterno != 6) {
            escolha(codigoMenuInterno){
              caso(1): // QUESTINÁRIO
                caracter pre_triagem[12]                      
                limpa()
                alerta()
                escreva("\ntecle enter para iniciar o questinário")
                leia(dummy) 
                limpa()
                letreiroPrograma()
                escreva("\nUse S para sim e N para não.\n")
                escreva("\n1- Você tem menos de 16 anos?\n")
                pre_triagem[0] = recebeSOuN()
                escreva("2- Você tem mais de 69 anos?\n")
                pre_triagem[1] = recebeSOuN()
                escreva("3- Você pesa menos de 50 kg?\n")
                pre_triagem[2] = recebeSOuN()
                escreva("4- Você fez algum procedimento cirúrgico nos últimos 6 meses?\n")
                pre_triagem[3] = recebeSOuN()
                escreva("5- Você fez tatuagem, colocou piercing ou brinco no último ano?\n")
                pre_triagem[4] = recebeSOuN()
                escreva("6- Você tem hepatite, AIDS, Doença de Chagas, malária ou HTLV?\n")
                pre_triagem[5] = recebeSOuN()
                limpa()
                letreiroPrograma()
                escreva("\n7- Você faz uso de drogas ilícitas injetávies?\n")
                pre_triagem[6] = recebeSOuN()
                escreva("8- Você tem problemas cardiácos?\n")
                pre_triagem[7] = recebeSOuN()
                escreva("9- Você teve diagnóstico ou suspeta de Covid-19 nos últimos 10 dias?\n")
                pre_triagem[8] = recebeSOuN()
                escreva("10- Você teve contato com pessoas com diagnóstico de Covid-19 nos últimos 7 dias?\n")
                pre_triagem[9] = recebeSOuN()
                escreva("11- Você fez alguma dessas vacinas nas últimas 48 horas (Covaxin/coronavac/Butatan) para Covid-19 ou gripe?\n")
                pre_triagem[10] = recebeSOuN()
                escreva("12- Você fez alguma dessas outras vacinas para Covid-19 nos últimos 7 dias (Astrazeneca/Oxford?fiocruz/Sputinik V/Janssen/Pfizer)?\n")
                pre_triagem[11] = recebeSOuN()
            
                impedido = falso
                para(inteiro i = 0; i < 12; i++) {
                  se (pre_triagem[i] == 's' ou pre_triagem[i] == 'S') {
                    impedido = verdadeiro
                    pare
                  }
                }
                respondeuQuestionario = verdadeiro
                pare

              caso (2): // AGENDAMENTO
                limpa()
                letreiroPrograma()
                u.aguarde(500)
                se (respondeuQuestionario == falso) { 
                  escreva("\n!!! Responda o questionário !!!\n\nÉ necessário responder ao questionário\nde pré-triagem para habilitar-se à doação.\n")
                  escreva("\ntecle enter para voltar ao menu")
                  leia(dummy)  
                } senao se (impedido) {
                  escreva("\nInfelizmente, no momento, você não cumpre os requisitos para efetuar a doação.\n")
                  escreva("\nLigue para o banco de sangue e saiba mais informações.\n")
                  escreva("\ntecle enter para voltar ao menu")
                  leia(dummy)  
                } senao {
                  
                  escreva("\nBANCOS DISPONÍVEIS: \n")
                  para (inteiro i = 0 ; i < proximoBanco ; i++) {
                    escreva("\n", i + 1 , " - ", bancos[i][0])
                  }
                  recebeCodigo(proximoBanco)
                  escreva("\nProcessando...\n")
                  u.aguarde(1500)
                  escreva("\nAgendamento efetuado com sucesso.\n")
                  escreva("\ntecle enter para voltar ao menu")
                  leia(dummy)  
                }
                pare

              caso (3): // ATUALIZAR CADASTRO
                limpa()
                letreiroPrograma()
                se (proximoDoador < 5) {  
                  escreva("\nNome: ")
                  leia(doadores[proximoDoador][0]) 
                  escreva("CPF: ")
                  leia(doadores[proximoDoador][1])                
                  proximoDoador++  

                  u.aguarde(500)  
                  escreva("\nCadastro atualizado com sucesso!\n")
                  u.aguarde(500)

                } senao {
                  escreva("\n!!! Sem espaço na base de dados !!!\n")
                }

                escreva("\ntecle enter para voltar ao menu")
                leia(dummy) 
                pare
              
              caso (4): // LISTA BANCOS
                limpa()
                letreiroPrograma()
                u.aguarde(500)
                listaBancos()
                pare

              caso (5):  // DICAS
                limpa()
                u.aguarde(500)
                dicas()
                escreva("\ntecle enter para voltar ao menu")
                leia(dummy)
            }
            limpa()
            menuDoador()
            codigoMenuInterno = recebeCodigo(6)
          }          
          pare

        caso 2: // ADMINISTRADOR
          limpa()
          menuAdmin()
          codigoMenuInterno = recebeCodigo(4)
          enquanto(codigoMenuInterno != 4) {
            escolha(codigoMenuInterno) {  
              caso 1:  // CADASTRAR BANCO
                limpa()
                letreiroPrograma()
                se (proximoBanco < 5) {  
                  escreva("\nNome do Banco de Sange: ")
                  leia(bancos[proximoBanco][0]) 
                  escreva("Endereço: ")
                  leia(bancos[proximoBanco][1])
                  escreva("Horário de atendimento: ")
                  leia(bancos[proximoBanco][2])
                  escreva("Email de contato: ")
                  leia(bancos[proximoBanco][3])
                  escreva("Telefone de contato: ")
                  leia(bancos[proximoBanco][4])
                  proximoBanco++  

                  u.aguarde(500)  
                  escreva("\nBanco de Sangue cadastrado com sucesso!\n")
                  u.aguarde(500)

                } senao {
                  escreva("\n!!! Sem espaço na base de dados !!!\n")  
                }

                escreva("\ntecle enter para voltar ao menu")
                leia(dummy)        

                pare
              caso 2: // LISTAR BANCOS
                u.aguarde(500)
                limpa()
                letreiroPrograma()
                u.aguarde(500)
                listaBancos()
                pare

              caso 3: // LISTAR DOADORES
                u.aguarde(500)
                limpa()
                letreiroPrograma()
                u.aguarde(500)
                listaDoadores()
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
