//
//  AddProductViewController.h
//  assignment9
//
//  Created by Vaibhav Mistry on 11/19/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *productIdTxtField;
@property (strong, nonatomic) IBOutlet UITextField *productNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *productDescriptionTxtField;
@property (strong, nonatomic) IBOutlet UITextField *productSellByDateTxtField;
@property (strong, nonatomic) IBOutlet UITextField *productPriceTxtField;
@property (strong, nonatomic) IBOutlet UITextField *productQuantityTxtField;
- (IBAction)addButtonClicked:(UIButton *)sender;
- (IBAction)selectImagePressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UIButton *selectImageButton;

@end
