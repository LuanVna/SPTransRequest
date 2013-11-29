//
//  SPTransRequest.m
//  TimeBus
//
//  Created by Luan Almeida on 11/28/13.
//  Copyright (c) 2013 LuanVna. All rights reserved.
//

#import "SPTransRequest.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPClient.h"


@implementation SPTransRequest
{
    NSMutableDictionary *respostaServer;
    NSString *previsaoDaChegada;
}



+(void)token: (NSString *)token{
    [[NSUserDefaults standardUserDefaults]setValue:token forKey:@"token"];
}

+(NSString *)token{
   return [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
}


+(void)requestServerSPTrans: (requestMethodGET)methodGET
                       line: (id)line
                   response: (void (^)(NSMutableDictionary *response))sucess
                       erro: (void (^)(NSError *error))fail{
    
    NSString *requestToken = [NSString stringWithFormat:@"http://api.olhovivo.sptrans.com.br/v0/Login/Autenticar?token=%@", [self token]];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:requestToken]];
    [httpClient setAuthorizationHeaderWithToken:[self token]];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:Nil parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"User authorized: %@", [operation responseString]);
        if ([[operation responseString] isEqualToString:@"true"]) {
            AFHTTPClient *httpClient = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:[self returnURL:methodGET line:line]]];
            NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:Nil parameters:nil];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *fail;
                sucess([NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&fail]);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                fail(error);
            }];
            [operation start];

        }else{
            NSLog(@"ERROR: User no authorized: %@", [operation responseString]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
    [operation start];
}

+(NSString *)returnURL: (requestMethodGET)methodGET line:(id)line{
    NSString *SPTrans = @"http://api.olhovivo.sptrans.com.br/v0";
    switch (methodGET) {
        case requestMethodGETLinhas:                return [NSString stringWithFormat:@"%@/Linha/Buscar?termosBusca=%@", SPTrans, line]; break;
        case requestMethodGETDetalhes:              return [NSString stringWithFormat:@"%@/Linha/CarregarDetalhes?codigoLinha=%@", SPTrans, line] ;break;
        case requestMethodGETParadas:               return [NSString stringWithFormat:@"%@/Parada/Buscar?termosBusca=%@", SPTrans, line] ;break;
        case requestMethodGETParadasPorLinha:       return [NSString stringWithFormat:@"%@/Parada/BuscarParadasPorLinha?codigoLinha=%@", SPTrans, line] ;break;
        case requestMethodGETParadasPorCorredor:    return [NSString stringWithFormat:@"%@/Parada/BuscarParadasPorCorredor?codigoCorredor=%@", SPTrans, line] ;break;
        case requestMethodGETCorredores:            return [NSString stringWithFormat:@"%@/Corredor", SPTrans] ;break;
        case requestMethodGETPosicaoDoVeiculo:      return [NSString stringWithFormat:@"%@/Posicao?codigoLinha=%@", SPTrans, line] ;break;
        case requestMethodGETLinha:                 return [NSString stringWithFormat:@"%@/Previsao/Linha?codigoLinha=%@", SPTrans, line] ;break;
        case requestMethodGETParada:                return [NSString stringWithFormat:@"%@/Previsao/Parada?codigoParada=%@", SPTrans, line] ;break;
    }
    return nil;
}


















@end
