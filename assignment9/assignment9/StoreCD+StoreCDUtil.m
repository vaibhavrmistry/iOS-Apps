//
//  StoreCD+StoreCDUtil.m
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import "StoreCD+StoreCDUtil.h"
#import "AppDelegate.h"

@implementation StoreCD (StoreCDUtil)

+(StoreCD *) addStoreInfoFromDictionary:(NSDictionary *)storeInfo
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error;
    StoreCD *storeEntity = nil;
    
    //Create a new store object
    storeEntity = [NSEntityDescription insertNewObjectForEntityForName:@"StoreCD" inManagedObjectContext:context];
    storeEntity.storeName = [storeInfo valueForKey:@"storeName"];
    storeEntity.storeAddress = [storeInfo valueForKey:@"storeAddress"];
    storeEntity.storeZip = [storeInfo valueForKey:@"storeZip"];
    storeEntity.storeTelephone = [storeInfo valueForKey:@"storeTelephone"];
    
    [appDelegate.managedObjectContext save:&error];
    
    return storeEntity;
    
    
}

+(StoreCD *) getStoreFromDatabase
{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    StoreCD *storeCD = nil;
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"StoreCD"];
    NSArray *fetchedObject = [context executeFetchRequest:request error:&error ];
    
    //get the first storeCD object
    if(fetchedObject.count != 0)
        storeCD = [fetchedObject objectAtIndex:0];
    
    return storeCD;
    
}







@end
