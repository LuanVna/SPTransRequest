//
//  SPTransRequest.h
//  TimeBus
//
//  Created by Luan Almeida on 11/28/13.
//  Copyright (c) 2013 LuanVna. All rights reserved.
//

#import <Foundation/Foundation.h>

enum requestMethodGET {
    requestMethodGETLinhas,
    requestMethodGETDetalhes,
    requestMethodGETParadas,
    requestMethodGETParadasPorLinha,
    requestMethodGETParadasPorCorredor,
    requestMethodGETCorredores,
    requestMethodGETPosicaoDoVeiculo,
    requestMethodGETLinha,
    requestMethodGETParada
};
typedef NSInteger requestMethodGET;

@interface SPTransRequest : NSObject
{
}



+(void)token: (NSString *)token;
+(void)requestServerSPTrans:(requestMethodGET)methodGET line: (id)line response: (void (^)(NSMutableDictionary *response))sucess
                       erro: (void (^)(NSError *error))fail;
@end
