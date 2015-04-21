//
//  CreateCVViewController.h
//  Career Map 3
//
//  Created by Adel  Shehadeh on 4/19/15.
//  Copyright (c) 2015 Adel  Shehadeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>
#import "CVThumbEditViewController.h"
@interface CreateCVViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>


//Outlets

@property (weak, nonatomic) IBOutlet UIImageView *CVjobSeekerThumb;
@property (weak, nonatomic) IBOutlet UITextField *CVjobSeekerFirstNameTextView;
@property (weak, nonatomic) IBOutlet UITextField *CVjobSeekerLastNameTextView;
@property (weak, nonatomic) IBOutlet UITextField *CVjobSeekerCurrentTitleTextView;
@property (strong, nonatomic) UIActionSheet *photoSourceActionSheet;

//Data





//actions
- (IBAction)closeCreateCVButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)saveCVButtonPressed:(UIBarButtonItem *)sender;
- (void) checkFieldsComplete;
- (void) CVthumbTapped;

@end
