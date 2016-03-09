//
//  Student.h
//  CoreDataDemo
//
//  Created by Vaibhav Mistry on 8/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Department;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rollNo;
@property (nonatomic, retain) Department *associatedDept;

@end
