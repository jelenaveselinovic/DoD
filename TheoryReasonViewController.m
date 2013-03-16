//
//  TheoryReasonViewController.m
//  HelioRoom
//
//  Created by admin on 1/20/13.
//  Copyright (c) 2013 Learning Technologies Group. All rights reserved.
//

#import "TheoryReasonViewController.h"

@interface TheoryReasonViewController ()

@end

NSString * theoryColor;
NSString * theoryName;

@implementation TheoryReasonViewController
@synthesize delegate =_delegate;

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
    
    
    self.contentSizeForViewInPopover = CGSizeMake(300.0, 95.0);
    

    //Add buttons
//    UIImage * buttonbg =[UIImage imageNamed:@"greyButton.png" ];
//    
//    self.cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
//    self.cancelButton.frame=CGRectMake(0,100,50,50);
//    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.cancelButton setBackgroundImage:buttonbg forState:UIControlStateNormal];
//    [self.view addSubview:self.cancelButton];
//    
//    //Add reason field
//    UIView *content = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
//    content.backgroundColor=[UIColor whiteColor];
//    self.reasonText = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 148, 99)];
//    self.reasonText.text=@"testing ne sadaso esasod ";
//    [self.reasonText setBackgroundColor:[UIColor blackColor]];
//    
//    [content addSubview:self.reasonText];
//    [self.view  addSubview:content];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.reasonText becomeFirstResponder];
}
- (IBAction)cancelPressed:(id)sender {
    [_delegate cancel];
}

- (IBAction)savePressed:(UIButton *)sender {
    NSLog(@"Save Button Pressed");
    [_delegate reasonSelected:self.reasonText.text :theoryColor :theoryName ];
}

//HELPER FUNCTIONS
-(void) setName:(NSString *)color:(NSString *)name{

    //NSString *reason= [NSString stringWithFormat:@"%@%@%@%@%@", @"I think ",color, @" is ",name, @" because "];
    NSString *reason= [NSString stringWithFormat:@"%@%@%@%@",name, @" is ",color, @" because "];
    theoryColor=color;
    theoryName=name;
    
    self.reasonText=nil;
    self.reasonText=[[UITextView alloc] init];
    
    self.reasonText.text = reason;
    [self setTitle:reason];
    //[self.tableView reloadData];

    
    [self.view setNeedsDisplay];
}
@end
