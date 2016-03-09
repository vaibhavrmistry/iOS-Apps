//
//  ViewController.m
//  TableViewDemo
//
//  Created by Vaibhav Mistry on 7/13/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation ViewController
@synthesize array=_array;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.array=[[NSMutableArray alloc] init];
    [self.array addObject:@"C"];
    [self.array addObject:@"C++"];
    [self.array addObject:@"Java"];
    [self.array addObject:@"Python"];
    [self.array addObject:@"Objective C"];
    [self.array addObject:@"Cobol"];
    [self.array addObject:@"Cobra"];
    [self.array addObject:@"JavaScript"];
    [self.array addObject:@"Jtag"];
    [self.array addObject:@"Others"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return 2;
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(section==0)
//    return 4;
//    return 6;
    return [self.array count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
              
    }
//    cell.textLabel.text=[NSString stringWithFormat:@"Row Number : %d",indexPath.row];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"Section Number: %d",indexPath.section];
    cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    return cell;
    
}


@end
