//
//  StoreCD.h
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItemCD;

@interface StoreCD : NSManagedObject

@property (nonatomic, retain) NSString * storeAddress;
@property (nonatomic, retain) NSString * storeName;
@property (nonatomic, retain) NSNumber * storeTelephone;
@property (nonatomic, retain) NSNumber * storeZip;
@property (nonatomic, retain) NSSet *associatedItem;
@end

@interface StoreCD (CoreDataGeneratedAccessors)

- (void)addAssociatedItemObject:(ItemCD *)value;
- (void)removeAssociatedItemObject:(ItemCD *)value;
- (void)addAssociatedItem:(NSSet *)values;
- (void)removeAssociatedItem:(NSSet *)values;

@end
