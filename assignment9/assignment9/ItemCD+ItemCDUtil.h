//
//  ItemCD+ItemCDUtil.h
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import "ItemCD.h"

@interface ItemCD (ItemCDUtil)
+(ItemCD *) addItemInfoFromDictionary:(NSDictionary *)itemInfo;
+(NSMutableArray *)fetchAllItems;
+(void) deleteItem:(ItemCD *)item;
@end
