//
//  ViewController.m
//  SimpleConsumer-iOS
//
//  Created by Chris Hamons on 4/11/18.
//  Copyright © 2018 Chris Hamons. All rights reserved.
//

#import "ViewController.h"
#include "SimpleLib-iOS/SimpleLib-iOS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    
    SimpleLib_Adder* adder = [[SimpleLib_Adder alloc] initWithX:2 y:3];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Result"
                                                                   message:[NSString stringWithFormat: @"2 + 3 = %d", [adder value]]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
