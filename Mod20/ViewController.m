//
//  ViewController.m
//  Mod20
//
//  Created by Krunal on 3/12/15.
//  Copyright (c) 2015 KM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int num = 123;
    __block int num2 = 345;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
       
        sleep(5);
        
        NSLog(@"num: %i", num);
        NSLog(@"num2: %i", num2);
        
        num2 = 3434;
        NSLog(@"num2 change: %i", num2);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.view.backgroundColor = [UIColor redColor];
        });
        
    });
    
    num = 455;
    num2 = 656;
    NSLog(@"outside num: %i", num);
    NSLog(@"outside num2: %i", num2);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
