//
//  Department.h
//  CoreDataDemo
//
//  Created by Vaibhav Mistry on 8/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Department : NSManagedObject

@property (nonatomic, retain) NSString * department_name;
@property (nonatomic, retain) NSSet *associatedStudent;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addAssociatedStudentObject:(Student *)value;
- (void)removeAssociatedStudentObject:(Student *)value;
- (void)addAssociatedStudent:(NSSet *)values;
- (void)removeAssociatedStudent:(NSSet *)values;

@end
