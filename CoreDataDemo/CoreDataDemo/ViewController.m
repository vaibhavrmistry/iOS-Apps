//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Vaibhav Mistry on 7/20/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseLayer.h"
#import "Student.h"
#import "Department.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *rollTextField;
@property (weak, nonatomic) IBOutlet UITextField *deptTextField;
@property (nonatomic,strong) NSArray *results;
@property (weak, nonatomic) IBOutlet UITableView *resultsTable;
@property (weak, nonatomic) IBOutlet UITableView *departmentTable;
@property (nonatomic,strong) NSArray *resultsDepartment;



@end

@implementation ViewController
@synthesize nameTextField=_nameTextField;
@synthesize rollTextField=_rollTextField;
@synthesize deptTextField=_deptTextField;
@synthesize results=_results;
@synthesize resultsTable=_resultsTable;
@synthesize departmentTable=_departmentTable;
@synthesize resultsDepartment=_resultsDepartment;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DatabaseLayer *data=[[DatabaseLayer alloc]init];
    self.results=[data fetchStudents];
    self.resultsDepartment=[data fetchDepartment];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)storeClicked:(id)sender
{
    [self.deptTextField endEditing:YES];
    DatabaseLayer *dbLayer=[[DatabaseLayer alloc]init];
    [dbLayer StoreStudentWithName:self.nameTextField.text WithRollNo:self.rollTextField.text WithDept:self.deptTextField.text];
    self.results=[dbLayer fetchStudents];
    self.resultsDepartment=[dbLayer fetchDepartment];
    [self.resultsTable reloadData];
    [self.departmentTable reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   if(tableView.tag==1)
        return [self.results count];
    else
        return [self.resultsDepartment count];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag==1)
    {UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    
    Student *student=(Student *)[self.results objectAtIndex:indexPath.row];
    cell.textLabel.text=student.name;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"Roll No: %@",student.rollNo];
    
    return cell;
        
    }
    else
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        if(!cell)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell2"];
        }
        
        
        Department *department=(Department *)[self.resultsDepartment objectAtIndex:indexPath.row];
        cell.textLabel.text=department.department_name;
    
        
        return cell;
        
    }
    
    
    
    
}

- (IBAction)clearButtonClicked:(id)sender
{
    self.nameTextField.text=nil;
    self.rollTextField.text=nil;
    self.deptTextField.text=nil;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DatabaseLayer *dbLayer=[[DatabaseLayer alloc]init];
    if(tableView.tag==1)
    {
    [dbLayer deleteStudentEntry:(Student *)[self.results objectAtIndex:indexPath.row]];
    
    
    
    
    }
    
    else
    {
        [dbLayer deleteDepartmentEntry:(Department *)[self.resultsDepartment objectAtIndex:indexPath.row]];
        
        
        
        
    }
    self.results=[dbLayer fetchStudents];
    self.resultsDepartment=[dbLayer fetchDepartment];
    [self.resultsTable reloadData];
    [self.departmentTable reloadData];
    
}



@end
