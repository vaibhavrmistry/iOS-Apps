//
//  MyView.m
//  CoreGraphicsPractice
//
//  Created by Vaibhav Mistry on 7/9/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "MyView.h"

@interface MyView()

@property (nonatomic) float userScale;

@end

@implementation MyView
@synthesize userScale=_userScale;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(float)userScale
{
    if(!_userScale)
        return 1;
    return _userScale;
}

-(void)pinchGesture:(UIPinchGestureRecognizer *) gesture
{
    NSLog(@"gesture Scale : %f", gesture.scale);
    self.userScale=gesture.scale;
    [self setNeedsDisplay];
    
    
}


//-(void)pinchGesture:(UIPinchGestureRecognizer *) gesture
//{
//    NSLog(@"gesture scale: %f",gesture.scale);
//    self.userScale=gesture.scale;
//    [self setNeedsDisplay];
//    
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    //Outer Circle
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGPoint midpoint= CGPointMake(self.bounds.size.width/2*self.userScale, self.bounds.size.height/2*self.userScale);
    CGFloat radius=self.bounds.size.width/2*self.userScale;
    if(self.bounds.size.height<self.bounds.size.width)
        radius=self.bounds.size.height/2*self.userScale;
    CGContextSetLineWidth(context, 2.0);
    [[UIColor orangeColor] setStroke];
    CGContextBeginPath(context);
    CGContextAddArc(context, midpoint.x, midpoint.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    //Left Eye
    CGPoint leftEyeMidpoint= CGPointMake(self.bounds.size.width/4*self.userScale, self.bounds.size.height/2-(self.bounds.size.height/8)*self.userScale);
    CGFloat leftEyeRadius=20*self.userScale;
//    CGContextSetLineWidth(context, 2.0);
//    [[UIColor orangeColor] setStroke];
    CGContextBeginPath(context);
    CGContextAddArc(context, leftEyeMidpoint.x, leftEyeMidpoint.y, leftEyeRadius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    //Right Eye
    CGPoint rightEyeMidpoint= CGPointMake(self.bounds.size.width/4+(self.bounds.size.width/2)*self.userScale, self.bounds.size.height/2-(self.bounds.size.height/8)*self.userScale);
    CGFloat rightEyeRadius=20*self.userScale;
//    CGContextSetLineWidth(context, 2.0);
//    [[UIColor orangeColor] setStroke];
    CGContextBeginPath(context);
    CGContextAddArc(context, rightEyeMidpoint.x, rightEyeMidpoint.y, rightEyeRadius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    //Smile
    //here we will reuse midpoint as before
    CGFloat smileRadius=self.bounds.size.width/2-30*self.userScale;
//    CGContextSetLineWidth(context, 2.0);
//    [[UIColor orangeColor] setStroke];
    CGContextBeginPath(context);
    CGContextAddArc(context, midpoint.x, midpoint.y, smileRadius, 0, M_PI, NO);
    CGContextStrokePath(context);
    
    
    //Nose
    //Left Line
    CGPoint startPoint1=CGPointMake(self.bounds.size.width/2*self.userScale, (self.bounds.size.height/2-self.bounds.size.height/10)*self.userScale);
    CGPoint endPoint1=CGPointMake(self.bounds.size.width/2-self.bounds.size.width/10*self.userScale, (self.bounds.size.height/2+self.bounds.size.height/10)*self.userScale);
    CGContextMoveToPoint(context, startPoint1.x, startPoint1.y);
    CGContextAddLineToPoint(context, endPoint1.x, endPoint1.y);
    CGContextStrokePath(context);
    //Bottom Line
    CGPoint endPoint2=CGPointMake((self.bounds.size.width/2+self.bounds.size.width/10)*self.userScale, (self.bounds.size.height/2+self.bounds.size.height/10)*self.userScale);
    CGContextMoveToPoint(context, endPoint1.x, endPoint1.y);
    CGContextAddLineToPoint(context, endPoint2.x, endPoint2.y);
    CGContextStrokePath(context);
    //Right Line
    CGContextMoveToPoint(context, endPoint2.x, endPoint2.y);
    CGContextAddLineToPoint(context, startPoint1.x, startPoint1.y);
    CGContextStrokePath(context);
}


@end
