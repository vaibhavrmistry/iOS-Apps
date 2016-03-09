//
//  AddProductViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/19/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "AddProductViewController.h"
#import "ItemCD+ItemCDUtil.h"



@interface AddProductViewController ()
@property (strong, nonatomic) UIAlertController *alertController;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@property (strong, nonatomic) NSData * selectedImageData;

@end

@implementation AddProductViewController
@synthesize selectedImageData,tapGestureRecognizer,selectImageButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
   
    [self setupAlertController];
    
    //Dismiss keyboard by pressing anywhere
    tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    //date picker
    [self initializeTextFieldInputView];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupAlertController{
    
    self.alertController = [UIAlertController alertControllerWithTitle:@"Select Image" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //create an action
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //Implement action
        [self handleCamera];
    }];
    UIAlertAction *imageGallery = [UIAlertAction actionWithTitle:@"Image Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //Implement action
        [self handleImageGallery];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        //Implement cancel action
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    //add action to alert controller
    [self.alertController addAction:camera];
    [self.alertController addAction:imageGallery];
    [self.alertController addAction:cancel];
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        
        [self.alertController setModalPresentationStyle:UIModalPresentationPopover];
        
        UIPopoverPresentationController *popPresenter = [self.alertController
                                                         popoverPresentationController];
        popPresenter.sourceView = selectImageButton ;
        popPresenter.sourceRect = selectImageButton.bounds;
       
    }
    
   
    
    
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addButtonClicked:(UIButton *)sender {
    
    if ([_productIdTxtField.text length]>0 && [_productNameTxtField.text length]>0 && [_productDescriptionTxtField.text length]>0 && [_productSellByDateTxtField.text length]>0 && [_productPriceTxtField.text length]>0 && [_productQuantityTxtField.text length]>0) {
        
        if ([[NSScanner scannerWithString:_productIdTxtField.text] scanFloat:NULL]) {
            if ([[NSScanner scannerWithString:_productPriceTxtField.text] scanFloat:NULL]) {
                
                if ([[NSScanner scannerWithString:_productQuantityTxtField.text] scanFloat:NULL]) {
                    
                    
                    
                    //date detection code
                    NSString *sellByDateString = [[NSString alloc]init];
                    sellByDateString = _productSellByDateTxtField.text;
                    
                    __block NSDate *detectedDate;
                    
                    
                    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingAllTypes error:nil];
                    [detector enumerateMatchesInString:sellByDateString
                                               options:kNilOptions
                                                 range:NSMakeRange(0, [sellByDateString length])
                                            usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
                     { detectedDate = result.date; }];
                    
                    
                    
                    if (selectedImageData)
                        
                        
                    {
                        
                        
                        
                        //Convert String to NSNumber
                        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                        f.numberStyle = NSNumberFormatterDecimalStyle;
                        NSNumber *itemId = [f numberFromString:self.productIdTxtField.text];
                        NSNumber *itemPrice = [f numberFromString:self.productPriceTxtField.text];
                        NSNumber *itemQuantity = [f numberFromString:self.productQuantityTxtField.text];
                        
                        //Add data to Core Data database
                        NSDictionary *itemInfo = @{@"itemId":itemId,
                                                   @"itemName":self.productNameTxtField.text,
                                                   @"itemDescription":self.productDescriptionTxtField.text,
                                                   @"itemSellByDate":detectedDate,
                                                   @"itemPrice":itemPrice,
                                                   @"itemQuantity":itemQuantity,
                                                   @"itemImageData":selectedImageData};
                        
                        //store it and NSLog it
                        NSLog([ItemCD addItemInfoFromDictionary:itemInfo].description);
                        
                        
                        
                    }
                    
                    else
                    {
                        NSString *msg = [NSString stringWithFormat:@"Please select an image"];
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                                       delegate:self
                                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                        return;
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //display an alert that the prod has added
                    NSString *msg = [NSString stringWithFormat:@"Item Added: %@",_productNameTxtField.text];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    //display an alert screen if non numeric data entered
                    NSString *msg = [NSString stringWithFormat:@"Please enter numeric data for quantity"];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    
                }
            }
            else{
                //display an alert screen if non numeric data entered
                NSString *msg = [NSString stringWithFormat:@"Please enter numeric data for price"];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                               delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            
        }
        else{
            //display an alert screen if non numeric data entered
            NSString *msg = [NSString stringWithFormat:@"Please enter numeric data for itemId"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                           delegate:self
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    }
    else
    {
        //display an alert screen if no details entered
        NSString *msg = [NSString stringWithFormat:@"One or more fields empty. Please enter all fields"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
    }

    
}

- (IBAction)selectImagePressed:(UIButton *)sender {
    
   
    [self presentViewController:self.alertController animated:YES completion:nil];
}

-(void)handleCamera{
    
#if TARGET_IPHONE_SIMULATOR
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Camera not available on simulator" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //Implement action
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
#elif TARGET_OS_IPHONE
    //Some code for iphone
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
    
#endif
}

-(void)handleImageGallery{
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    selectedImageData = UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"], 1);
    
    
    UIImage *img = [[UIImage alloc]initWithData:selectedImageData];
    [self.productImageView setImage:img];
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}


//date picker
- (void) initializeTextFieldInputView {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minuteInterval = 5;
    datePicker.backgroundColor = [UIColor whiteColor];
    [datePicker addTarget:self action:@selector(dateUpdated:) forControlEvents:UIControlEventValueChanged];
    _productSellByDateTxtField.inputView = datePicker;
}

- (void) dateUpdated:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _productSellByDateTxtField.text = [formatter stringFromDate:datePicker.date];
}

-(void) doneButtonWasPressed{
    
    [self resignFirstResponder];
    
}



@end
