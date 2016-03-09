//
//  Photo.h
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/26/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Photo : NSManagedObject

@property (nonatomic, retain) NSData * photoData;
@property (nonatomic, retain) NSString * url;

@end
