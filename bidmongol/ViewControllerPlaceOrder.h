//
//  ViewControllerPlaceOrder.h
//  bidmongol
//
//  Created by Delgersuren Bold on 12/21/12.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerPlaceOrder : UIViewController <UITextFieldDelegate>


@property (retain, nonatomic) IBOutlet UILabel *formNotification;
@property (retain, nonatomic) IBOutlet UITextField *nameText;
@property (retain, nonatomic) IBOutlet UITextField *phoneText;
@property (retain, nonatomic) IBOutlet UITextField *emailText;
@property (retain, nonatomic) IBOutlet UITextField *addressText;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *proceedB;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *submitButton;
- (IBAction)submitButton:(id)sender;


@end

