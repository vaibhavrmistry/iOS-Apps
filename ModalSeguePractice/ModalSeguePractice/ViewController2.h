//
//  ViewController2.h
//  ModalSeguePractice
//
//  Created by Vaibhav Mistry on 7/9/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DismissViewDelegate

-(void)dismissVC;

@end

@interface ViewController2 : UIViewController

@property (nonatomic,strong) id<DismissViewDelegate> delegate;
@end
