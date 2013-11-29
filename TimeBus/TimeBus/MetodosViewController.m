//
//  MetodosViewController.m
//  TimeBus
//
//  Created by Luan Almeida on 11/29/13.
//  Copyright (c) 2013 LuanVna. All rights reserved.
//

#import "MetodosViewController.h"

@interface MetodosViewController ()

@end

@implementation MetodosViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Metodos = @[@"Linhas",@"Detalhes",@"Paradas",@"Paradas Por Linha",@"Paradas Por Corredor",@"Corredores",@"Posicao Do Veiculo",@"Linhas",@"Parada"];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Metodos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [[cell textLabel] setText:Metodos[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:indexPath.row] forKey:@"metodo"];
}





















@end
