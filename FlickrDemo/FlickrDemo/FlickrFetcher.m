//
//  FlickrFetcher.m
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "FlickrFetcher.h"
#import "AppDelegate.h"
#import "Photo.h"

@implementation FlickrFetcher
@synthesize delegate=_delegate;

-(NSArray *)fetchPhotos
{
    NSURL *url=[NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=243dbe2254ed4609fe242c1db54508c0&extras=url_m%2C+url_l%2C&format=json&nojsoncallback=1"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    NSMutableDictionary *resposeDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:nil];
    
    NSDictionary *photosDictionary=[resposeDictionary valueForKey:@"photos"];
    
    NSArray *photos=[photosDictionary valueForKey:@"photo"];
    
    //NSData *imageData=[NSData dataWithContentsOfURL:<#(NSURL *)#>];
    
    return photos;

    
    //NSLog(@"%@",resposeDictionary);
    
    
}


//-(UIImage *) downloadPhotoWithURL:(NSURL *) url
//{
//    UIImage *image=[self fetchPhotoFromDatabase:(NSString *)url];
//    
//    
//    
//    
//    NSData *photoData=[NSData dataWithContentsOfURL:url];
//    
//    UIImage *downloadedImage=[UIImage imageWithData:photoData];
//    
//    return downloadedImage;
//    
//    
//}

-(void) fetchPhotoFromDatabase:(NSString *)dbURL
{
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Photo"];
    
    NSError *error;
    
    NSPredicate *dbPredicate=[NSPredicate predicateWithFormat:@"url == %@", dbURL];
    
    [request setPredicate:dbPredicate];
    
    NSArray *result=[appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    
    if([result count]==0)
    {
        

        dispatch_queue_t downloadQueue=dispatch_queue_create("downloadImage", NULL);
        __block UIImage *downloadedImage;
        
    dispatch_async(downloadQueue, ^{
        NSURL *url=[NSURL URLWithString:dbURL];
        NSData *photoData=[NSData dataWithContentsOfURL:url];
        downloadedImage=[UIImage imageWithData:photoData];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *error;
                Photo *storePhoto=[NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:appDelegate.managedObjectContext];
        storePhoto.url=dbURL;
        storePhoto.photoData=photoData;
        
        
        [appDelegate.managedObjectContext insertObject:storePhoto];
        
        [appDelegate.managedObjectContext save:&error];
        
        [self.delegate setImageToImageView:downloadedImage];
            
            
            
            
        });
        
        
        
    });
        
        
        

        
    }
    else
    {
        Photo *photoObject=[result objectAtIndex:0];
    
    
    UIImage *resultImage=[UIImage imageWithData:photoObject.photoData];
    
    [self.delegate setImageToImageView:resultImage];

    }

}



@end


