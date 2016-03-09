//
//  ViewControllerCircle.m
//  IpadDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewControllerCircle.h"
#import "MyView.h"

@interface ViewControllerCircle ()<myViewDelegate,UISplitViewControllerDelegate>
@property (strong, nonatomic) IBOutlet MyView *myView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic,strong) UIBarButtonItem *myBarButton;
@end

@implementation ViewControllerCircle
@synthesize userScale=_userScale;
@synthesize myView=_myView;
@synthesize toolbar=_toolbar;
@synthesize myBarButton=_myBarButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setUserScale:(float)userScale
{
    _userScale=userScale;
    [self.myView setNeedsDisplay];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myView.delegate=self;
    self.splitViewController.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(float)getUserScale
{
    if(!self.userScale)
        return 1;
    return self.userScale;
}

-(void)pinchGesture:(UIPinchGestureRecognizer *) gesture
{
    self.userScale=gesture.scale;
    [self.myView setNeedsDisplay];
}


-(BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    if(UIInterfaceOrientationIsPortrait(orientation))
        return YES;
    return NO;
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    [self setBarButtonItem:barButtonItem];
}


-(void)setBarButtonItem:(UIBarButtonItem *) barButton
{
    barButton.title=@"show Menu";
    NSMutableArray *toolbarItems=[self.toolbar.items mutableCopy];
    if(self.myBarButton)[toolbarItems removeObject:self.myBarButton];
    if(barButton) [toolbarItems insertObject:barButton atIndex:0];
    self.toolbar.items=toolbarItems;
    self.myBarButton=barButton;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self setBarButtonItem:nil];
    
}





@end
