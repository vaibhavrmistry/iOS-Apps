//
//  ProductDetailsViewController.h
//  assignment9
//
//  Created by Vaibhav Mistry on 11/19/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCD.h"

@interface ProductDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *prodIDLabel;
@property (strong, nonatomic) IBOutlet UILabel *prodNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *prodDescLabel;
@property (strong, nonatomic) IBOutlet UILabel *prodSellByDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *prodPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *prodQuantityLabel;
@property (strong, nonatomic) IBOutlet UIImageView *prodImage;
@property (strong, nonatomic) ItemCD *item;
- (IBAction)deleteItemClicked:(UIButton *)sender;
- (id)initWithItem:(ItemCD *)itemObject;

@end
