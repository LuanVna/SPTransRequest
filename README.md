SPTransRequest
==============

Classes em IOS para conexão com os servidores da SPTrans

Bem vindo ao SPTransRequest, abaixo temos uma breve explicação de como é o funcionamento deste pequeno frameworking.

Para iniciar você precisa de um token da SPTrans, disponível em
[SPTrans Desenvolvedores](http://www.sptrans.com.br/desenvolvedores/)

Crie um aplicativo no site e copie o token do seu app.

Vá para a classe AppDelegate do Iphone e no metodo:
- (BOOL)application: didFinishLaunchingWithOptions

Chame o metodo token da classe SPTransRequest:

[SPTransRequest token:@"SEU TOKEN AQUI"];

Para buscar informações do servidor da SPTrans utilizamos o metodo:

requestServerSPTrans: line: response: erro:

Parametros informados ao metodo:

requestMethodGET - Um enum com os metodos disponiveis no servidor da SPTrans.

Segue a lista de Enum:
     requestMethodGETLinhas
     requestMethodGETDetalhes 
     requestMethodGETParadas 
     requestMethodGETParadasPorLinha,
     requestMethodGETParadasPorCorredor 
     requestMethodGETCorredores 
     requestMethodGETPosicaoDoVeiculo 
     requestMethodGETLinha 
     requestMethodGETParada

Veja a documentação da SPTrans, cada enum representa o nome dos metodos.
[Documentação SPTrans](http://www.sptrans.com.br/desenvolvedores/APIOlhoVivo/Documentacao.aspx?1#docApi-linhas)

Usando o metodo para buscar as paradas:

 [SPTransRequest requestServerSPTrans:requestMethodGETLinha line:linha response:^(NSMutableDictionary *response) {
        NSLog(@"Informações encontradas %@", response);
    } erro:^(NSError *error) {
        NSLog(@"Erro %@", [error description]);
    }]; 
