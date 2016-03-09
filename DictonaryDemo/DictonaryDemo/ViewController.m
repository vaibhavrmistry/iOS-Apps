//
//  ViewController.m
//  DictonaryDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc]init];
    
    NSMutableDictionary *dictionaryPublisher =[[NSMutableDictionary alloc]init];
    
    [dictionaryPublisher setValue:@"ABC Publisher" forKey:@"name"];
    [dictionaryPublisher setValue:@"1000586" forKey:@"registration number"];
    [dictionaryPublisher setValue:[NSNumber numberWithInt:123645] forKey:@"name"];
    
    NSMutableDictionary *dictionaryBook1=[[NSMutableDictionary alloc]init];
    [dictionaryBook1 setValue:@"Book1" forKey:@"title"];
    [dictionaryBook1 setValue:@"Author1" forKey:@"author"];
    
    NSMutableDictionary *dictionaryBook2=[[NSMutableDictionary alloc]init];
    [dictionaryBook2 setValue:@"Book2" forKey:@"title"];
    [dictionaryBook2 setValue:@"Author2" forKey:@"author"];
    
    NSMutableDictionary *dictionaryBook3=[[NSMutableDictionary alloc]init];
    [dictionaryBook3 setValue:@"Book3" forKey:@"title"];
    [dictionaryBook3 setValue:@"Author3" forKey:@"author"];
    
    NSMutableArray *arrayBooks=[[NSMutableArray alloc]init];
    [arrayBooks addObject:dictionaryBook1];
    [arrayBooks addObject:dictionaryBook2];
    [arrayBooks addObject:dictionaryBook3];
    
    [dictionaryPublisher setValue:arrayBooks forKey:@"books"];
    
    
    
    
    [dictionary setValue:dictionaryPublisher forKey:@"publisher"];
    
    NSLog(@"%@",dictionary);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
