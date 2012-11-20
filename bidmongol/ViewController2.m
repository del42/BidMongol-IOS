//
//  ViewController2.m
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize confirmationLabelForAddUser;
@synthesize nameText;
@synthesize phoneText;
@synthesize addressText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNameText:nil];
    [self setPhoneText:nil];
    [self setAddressText:nil];
    [self setConfirmationLabelForAddUser:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [nameText release];
    [phoneText release];
    [addressText release];
    [confirmationLabelForAddUser release];
    [super dealloc];
}
- (IBAction)proceedButton:(id)sender {
    NSLog(@"Here is the log msg");
    NSLog(@"\n\n%@",self.nameText.text);
    self.confirmationLabelForAddUser.text=@"Succesfully added! Thank you...";
    
}
@end
