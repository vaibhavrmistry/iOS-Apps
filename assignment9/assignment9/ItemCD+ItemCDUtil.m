//
//  ItemCD+ItemCDUtil.m
//  
//
//  Created by Vaibhav Mistry on 11/19/15.
//
//

#import "ItemCD+ItemCDUtil.h"
#import "AppDelegate.h"
#import "StoreCD+StoreCDUtil.h"

@implementation ItemCD (ItemCDUtil)

+(ItemCD *) addItemInfoFromDictionary:(NSDictionary *)itemInfo
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    ItemCD *itemEntity = nil;
    
    //Create a new item object
    itemEntity = [NSEntityDescription insertNewObjectForEntityForName:@"ItemCD" inManagedObjectContext:context];
    itemEntity.itemId = [itemInfo valueForKey:@"itemId"];
    itemEntity.itemName = [itemInfo valueForKey:@"itemName"];
    itemEntity.itemDescription = [itemInfo valueForKey:@"itemDescription"];
    itemEntity.itemSellByDate = [itemInfo valueForKey:@"itemSellByDate"];
    itemEntity.itemPrice = [itemInfo valueForKey:@"itemPrice"];
    itemEntity.itemQuantity = [itemInfo valueForKey:@"itemQuantity"];
    itemEntity.itemImageData = [itemInfo valueForKey:@"itemImageData"];
    
    
    //get the storeCD
    StoreCD *store = [StoreCD getStoreFromDatabase];
    
    //set the associated store
    itemEntity.associatedStore =store;
    
    
    //save Context
    NSError *error;
    if (![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
    }
    
    
    
    
    return itemEntity;
    
    
}

+(NSMutableArray *)fetchAllItems
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ItemCD"];
    NSError * error;
    NSArray *fetchedObject = [context executeFetchRequest:request error:&error ];
    
    return [NSMutableArray arrayWithArray:fetchedObject];
    
    
    
}

+(void) deleteItem:(ItemCD *)item
{
    NSError *error;
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.managedObjectContext deleteObject:item];
    [appDelegate.managedObjectContext save:&error];
    
}





@end
