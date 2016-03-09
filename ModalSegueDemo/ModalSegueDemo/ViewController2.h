//
//  ViewController2.h
//  ModalSegueDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DimissViewDelegate

-(void)dismissVC;

@end

@interface ViewController2 : UIViewController
@property (nonatomic,strong) id<DimissViewDelegate> delegate;

@end
