//
//  ViewControllerPlaceOrder.m
//  bidmongol
//
//  Created by Delgersuren Bold on 12/21/12.
//
//

#import "ViewControllerPlaceOrder.h"
@interface ViewControllerPlaceOrder ()

@end
@implementation ViewControllerPlaceOrder
@synthesize formNotification;
@synthesize nameText;
@synthesize phoneText;
@synthesize addressText;
@synthesize proceedB;
@synthesize submitButton;
@synthesize emailText;


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
    [self setEmailText:nil];
    [self setFormNotification:nil];
    [self setProceedB:nil];
    [self setSubmitButton:nil];
    [super viewDidUnload];
    [formNotification setHidden:TRUE];
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
    [emailText release];
    [formNotification release];
    [proceedB release];
    [submitButton release];
    [super dealloc];
}
- (IBAction)submitButton:(id)sender {
    NSLog(@"Here is the log msg");
    NSLog(@"\n%@",self.nameText.text);
    NSLog(@"\n%@",self.phoneText.text);
    NSLog(@"\n%@",self.emailText.text);
    NSLog(@"\n%@",self.addressText.text);
    
    NSString *get = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/webserver-to-db-customer.php?cname=%@&cphone=%@&cemail=%@&caddress=%@",self.nameText.text, self.phoneText.text, self.emailText.text,self.addressText.text];
    
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:get]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:nil];
    
    if (data) {
        NSLog(@"Connection establisted successfully");
    } else {
        NSLog(@"Connection failed.");
    }
    UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:@"Request Submitted" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
}

- (IBAction)proceedButton:(id)sender {
    NSLog(@"Here is the log msg");
    NSLog(@"\n%@",self.nameText.text);
    NSLog(@"\n%@",self.phoneText.text);
    NSLog(@"\n%@",self.emailText.text);
    NSLog(@"\n%@",self.addressText.text);
    
    NSString *get = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/webserver-to-db-customer.php?cname=%@&cphone=%@&cemail=%@&caddress=%@",self.nameText.text, self.phoneText.text, self.emailText.text,self.addressText.text];
    
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:get]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:nil];
    
    if (data) {
        NSLog(@"Connection establisted successfully");
    } else {
        NSLog(@"Connection failed.");
    }
    UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:@"Request Submitted" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
    
    
}
@end

