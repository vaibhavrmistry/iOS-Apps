//
//  MyView.h
//  ProtocolDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol myViewDelegate

-(float) getUserScale;

@end

@interface MyView : UIView

@property(nonatomic,strong) id <myViewDelegate> delegate;

@end
