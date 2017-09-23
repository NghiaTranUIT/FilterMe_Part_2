//
//  FeViewController.m
//  FilterMe-PartTwo
//
//  Created by Nghia Tran on 6/17/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeViewController.h"
#import "CIFilter+LUT.h"

@interface FeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load photo
    UIImage *photo = [UIImage imageNamed:@"Filter-Me_sample.jpg"];
    
    // Create filter
    CIFilter *lutFilter = [CIFilter filterWithLUT:@"FilterMe_Part2_ProcessedLUT" dimension:64];
    
    // Set parameter
    CIImage *ciImage = [[CIImage alloc] initWithImage:photo];
    [lutFilter setValue:ciImage forKey:@"inputImage"];
    CIImage *outputImage = [lutFilter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:[NSDictionary dictionaryWithObject:(__bridge id)(CGColorSpaceCreateDeviceRGB()) forKey:kCIContextWorkingColorSpace]];
    
    UIImage *newImage = [UIImage imageWithCGImage:[context createCGImage:outputImage fromRect:outputImage.extent]];
    
    _imageView.image = newImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
