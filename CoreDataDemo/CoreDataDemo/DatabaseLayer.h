//
//  DatabaseLayer.h
//  CoreDataDemo
//
//  Created by Vaibhav Mistry on 7/20/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface DatabaseLayer : NSObject
-(void)StoreStudentWithName:(NSString *)name WithRollNo:(NSString *)roll WithDept:(NSString *)dept;
-(NSArray *) fetchStudents;
-(void) deleteStudentEntry:(Student *)student;
-(void) deleteDepartmentEntry:(Department *)department;
-(NSArray *) fetchDepartment;

@end
