//
//  ViewController.h
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@end
