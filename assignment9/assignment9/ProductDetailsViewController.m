//
//  ProductDetailsViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/19/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "ProductDetailsViewController.h"
#import "AppDelegate.h"
#import "ItemCD+ItemCdUtil.h"

@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController
@synthesize prodIDLabel,prodNameLabel,prodDescLabel,prodPriceLabel,prodQuantityLabel,prodSellByDateLabel,prodImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    prodIDLabel.text = [NSString stringWithFormat:@"%@", _item.itemId];
    prodNameLabel.text = _item.itemName;
    prodDescLabel.text = _item.itemDescription;
    UIImage *img = [[UIImage alloc]initWithData:_item.itemImageData];
    [prodImage setImage:img];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:_item.itemSellByDate];
    
    prodSellByDateLabel.text = stringFromDate;
    
    prodPriceLabel.text = [NSString stringWithFormat:@"%@", _item.itemPrice];
    prodQuantityLabel.text = [NSString stringWithFormat:@"%@", _item.itemQuantity];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteItemClicked:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Delete"
                                                    message:@"Press Ok to Delete"
                                                   delegate:self    // <------
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if(buttonIndex == 1)
    {
        //Delete code here
        [ItemCD deleteItem:_item];
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        [self performSegueWithIdentifier:@"deleteToDefaultSegue" sender:nil];
        
    }
    else
    {
        NSLog(@"Cancel pressed");
    }
    
}


- (id)initWithItem:(ItemCD *)itemObject
{
    self = [super initWithNibName:@"ProductDetailsViewController" bundle:nil];
    if (self) {
        _item = itemObject;
    }
    return self;
}




@end
