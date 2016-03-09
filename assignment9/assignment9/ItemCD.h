//
//  ItemCD.h
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StoreCD;

@interface ItemCD : NSManagedObject

@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSNumber * itemId;
@property (nonatomic, retain) NSData * itemImageData;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * itemPrice;
@property (nonatomic, retain) NSNumber * itemQuantity;
@property (nonatomic, retain) NSDate * itemSellByDate;
@property (nonatomic, retain) StoreCD *associatedStore;

@end
