//
//  TimeBusMap.h
//  TimeBus
//
//  Created by Luan Almeida on 11/28/13.
//  Copyright (c) 2013 LuanVna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPTransRequest.h"
#import "PopoverView.h"
#import "MetodosViewController.h"

@interface TimeBusMap : UIViewController <UITextFieldDelegate, PopoverViewDelegate>
{
    PopoverView *popup;
    NSArray *Metodos;
}

@property (strong, nonatomic) IBOutlet UITextField *linha;
@property (strong, nonatomic) IBOutlet UITextView *resposta;


-(IBAction)metodos:(id)sender;

@end
