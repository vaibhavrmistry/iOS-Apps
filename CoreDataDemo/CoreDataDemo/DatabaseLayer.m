//
//  DatabaseLayer.m
//  CoreDataDemo
//
//  Created by Vaibhav Mistry on 7/20/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "DatabaseLayer.h"
#import "AppDelegate.h"
#import "Student.h"
#import "Department.h"



@implementation DatabaseLayer

-(void)StoreStudentWithName:(NSString *)name WithRollNo:(NSString *)roll WithDept:(NSString *)dept
{
    NSError *error;
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Student *student=[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.managedObjectContext];

    
    Department *department=[NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:appDelegate.managedObjectContext];
    
    
    
    student.name=name;
    student.rollNo=roll;
    department.department_name=dept;
    
    student.associatedDept=department;
    
    [appDelegate.managedObjectContext insertObject:student];
    
    [appDelegate.managedObjectContext insertObject:department];
    
    [appDelegate.managedObjectContext save:&error];
    
}

-(NSArray *) fetchStudents
{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Student"];
    
 
    
    NSError *error;
    
    NSArray *results=[appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    
    return results;
    
}

-(void) deleteStudentEntry:(Student *)student
{
    NSError *error;
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.managedObjectContext deleteObject:student];
    [appDelegate.managedObjectContext save:&error];
    
}




-(NSArray *) fetchDepartment
{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *requestDepartment=[[NSFetchRequest alloc]initWithEntityName:@"Department"];
    
    NSError *error;
    
    NSArray *resultsDepartment=[appDelegate.managedObjectContext executeFetchRequest:requestDepartment error:&error];
    
    return resultsDepartment;
    
}

-(void) deleteDepartmentEntry:(Department *)department
{
    NSError *error;
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.managedObjectContext deleteObject:department];
    [appDelegate.managedObjectContext save:&error];
    
}


@end
