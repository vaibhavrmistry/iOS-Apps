//
//  NSArray+DisplayArray.m
//  CategoriesDemo
//
//  Created by Vaibhav Mistry on 8/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "NSArray+DisplayArray.h"

@implementation NSArray (DisplayArray)
-(void)displayArray
{
    for(int i=0; i<[self count]; i++)
    {
        NSLog(@"%@", (NSString *)[self objectAtIndex:i]);
    }
    
}
@end
