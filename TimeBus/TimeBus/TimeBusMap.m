//
//  TimeBusMap.m
//  TimeBus
//
//  Created by Luan Almeida on 11/28/13.
//  Copyright (c) 2013 LuanVna. All rights reserved.
//

#import "TimeBusMap.h"

@interface TimeBusMap ()

@end

@implementation TimeBusMap

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
        //DEFINA O TOKEN NO APPDELEGATE
//    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//    {
//          [SPTransRequest token:@"TOKEN"];
//    return YES;
//    }
    Metodos = @[@"Linhas",@"Detalhes",@"Paradas",@"Paradas Por Linha",@"Paradas Por Corredor",@"Corredores",@"Posicao Do Veiculo",@"Linhas",@"Parada"]; 
    [_linha setDelegate:self];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_linha resignFirstResponder];
    [self buscarLinha:[textField text]];
    return YES;
}


-(void)buscarLinha:(id)linha{
    
//    ENUM
//    requestMethodGETLinhas,
//    requestMethodGETDetalhes,
//    requestMethodGETParadas,
//    requestMethodGETParadasPorLinha,
//    requestMethodGETParadasPorCorredor,
//    requestMethodGETCorredores,
//    requestMethodGETPosicaoDoVeiculo,
//    requestMethodGETLinha,
//    requestMethodGETParada
    
    NSString *metodo = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"metodo"]];
    NSLog(@"Metodo %@", metodo);
    [SPTransRequest requestServerSPTrans:[metodo integerValue] line:linha response:^(NSMutableDictionary *response) {
    
        NSMutableString *res = [NSMutableString new];
        for (NSString* line in response)
            {
                [res appendFormat: @"%@\n", line];
            }
        [_resposta setText:res];
        
    } erro:^(NSError *error) {
        [[[UIAlertView alloc]initWithTitle:@"Erro" message:[error description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self resignFirstResponder];
}


-(IBAction)metodos:(id)sender{ 
    [[self navigationController] pushViewController:[[self storyboard] instantiateViewControllerWithIdentifier:@"MetodosViewController"] animated:YES];
}

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"metodo %@", Metodos[index]);
}











@end
