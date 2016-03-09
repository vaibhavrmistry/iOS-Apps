//
//  MyView.m
//  ProtocolDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "MyView.h"

@interface MyView()
//@property(nonatomic) float userScale;
@property(nonatomic) float userTranslation;
@property(nonatomic) CGPoint myTranslation;

@end

@implementation MyView
//@synthesize userScale=_userScale;
@synthesize userTranslation=_userTranslation;
@synthesize delegate=_delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//-(float)userScale
//{
//    if(!_userScale)
//        return 1;
//    return _userScale;
//}

-(float)userTranslation
{
    if(!_userTranslation)
        return 1;
    return _userTranslation;
}

//-(void)pinchGesture:(UIPinchGestureRecognizer *) gesture
//{
//    NSLog(@"gesture Scale : %f", gesture.scale);
//    self.userScale=gesture.scale;
//    [self setNeedsDisplay];

    
//}

-(void)panGesture:(UIPanGestureRecognizer *) gesture
{
    CGPoint translation=[gesture translationInView:self];
    NSLog(@"pan translation x: %f   y: %f",translation.x, translation.y);
    self.myTranslation=translation;
    //self.userTranslation=translation.y;
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    //Circle
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGPoint midpoint=CGPointMake(self.bounds.size.width/2+self.myTranslation.x, self.bounds.size.height/2+self.myTranslation.y);
    
    CGFloat radius= self.bounds.size.width/2*[self.delegate getUserScale];
    if(self.bounds.size.height < self.bounds.size.height)
        radius=self.bounds.size.height/2*[self.delegate getUserScale];
    
       if(radius<10.0)
          radius=10.0;
      if(radius>150.0)
       radius=150.0;
    
    
    CGContextSetLineWidth(context, 1.0);
    [[UIColor blueColor] setStroke];
    
    CGContextBeginPath(context);
    CGContextAddArc(context, midpoint.x, midpoint.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    //    //Line
    //
    //    CGPoint startPoint= CGPointMake(10, 10);
    //    CGPoint endPoint= CGPointMake(100, 100);
    //    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    //    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    //    //CGContextStrokePath(context);
    //
    //    //Triangle
    //
    //    //CGPoint startPoint1= CGPointMake(50, 50);
    //    CGPoint endPoint1= CGPointMake(50, 100);
    //    //CGContextMoveToPoint(context, startPoint1.x, startPoint1.y);
    //    CGContextAddLineToPoint(context, endPoint1.x, endPoint1.y);
    //    //CGContextStrokePath(context);
    //
    //
    //    //CGPoint endPoint2= CGPointMake();
    //    //CGContextMoveToPoint(context, endPoint1.x, endPoint1.y);
    //    //CGContextAddLineToPoint(context, startPoint.x, startPoint.y);
    //    CGContextClosePath(context);
    //    
    //    CGContextStrokePath(context);
    //    
    
    
    
}


@end
