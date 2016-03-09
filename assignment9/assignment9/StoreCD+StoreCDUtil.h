//
//  StoreCD+StoreCDUtil.h
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import "StoreCD.h"

@interface StoreCD (StoreCDUtil)
+(StoreCD *) addStoreInfoFromDictionary:(NSDictionary *)storeInfo;
+(StoreCD *) getStoreFromDatabase;
@end
