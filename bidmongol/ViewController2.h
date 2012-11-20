//
//  ViewController2.h
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *confirmationLabelForAddUser;
@property (retain, nonatomic) IBOutlet UITextView *nameText;
@property (retain, nonatomic) IBOutlet UITextView *phoneText;
@property (retain, nonatomic) IBOutlet UITextView *addressText;
- (IBAction)proceedButton:(id)sender;

@end
