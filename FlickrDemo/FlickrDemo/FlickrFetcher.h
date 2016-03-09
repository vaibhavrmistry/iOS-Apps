//
//  FlickrFetcher.h
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FlickrFetcherProtocol

-(void)setImageToImageView:(UIImage *)image;



@end

@interface FlickrFetcher : NSObject

-(NSArray *)fetchPhotos;
-(UIImage *) downloadPhotoWithURL:(NSURL *) url;
-(void) fetchPhotoFromDatabase:(NSString *)dbURL;
@property (nonatomic,strong) id<FlickrFetcherProtocol> delegate;

@end
