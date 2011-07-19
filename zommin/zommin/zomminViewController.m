//
//  zomminViewController.m
//  zommin
//
//  Created by Ayush Goel on 18/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "zomminViewController.h"

@implementation zomminViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    imagescroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,768,950)];
   // [imagescroll setBackgroundColor:[UIColor grayColor]];
    imagescroll.contentSize=CGSizeMake(768,950);
    [self.view addSubview:imagescroll];
    [imagescroll release];
    
    mySlider=[[UISlider alloc]initWithFrame:CGRectMake(550,980,200, 20)];
    [self.view addSubview:mySlider];
    [mySlider release];
    
    mySlider.enabled=YES;
    mySlider.minimumValue=1;
    mySlider.maximumValue=2;
    mySlider.continuous = YES;
    [mySlider addTarget:self action:@selector(sliderMove:) forControlEvents:UIControlEventValueChanged];
  //  [mySlider addTarget:self action:@selector(sliderMove:) forControlEvents:UIControlEventTouchUpInside];
    
    
    imageArray=[[NSMutableArray alloc]init];
    
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<3;j++)
        {
            myView=[[UIImageView alloc]initWithFrame:CGRectMake(50+j*250,50+i*300,200,200)];
            myView.image=[UIImage imageNamed:@"a1.jpeg"];
            [imagescroll addSubview:myView];
            [imageArray addObject:myView];
            [myView release];
            
        }
    }
    [super viewDidLoad];
}
float value=0;
int nofrows;
int nofcols;
- (void) sliderMove:(UISlider*) theSlider 
{
  float newvalue=(float)theSlider.value;
   if(newvalue > 1.5 )
   {    nofcols = 1;
        nofrows =9;
   }
       else if(newvalue>1.1)
       {    nofcols = 2;
           nofrows =5;
       }
    else
    {    nofcols = 3;
        nofrows =3;
    }
    
   
    
    float changed=newvalue-value;
    value=(float)theSlider.value;
   
    float width =  200 * value;
    float  height = 200* value;
    float heightadd = 50;
  
    float widthadd = 50;
    for(int i=0;i<nofrows;i++)
    {
        for (int j=0; j<nofcols; j++) {
            if((i*nofcols+j)<[imageArray count])
            {
            UIImageView *temp=[imageArray objectAtIndex:i*nofcols+j];
            CGRect frameRect = CGRectMake(0, 0, 0, 0);
           
            frameRect.size.width= width;
            frameRect.size.height= height;

            
            frameRect.origin.y = heightadd;
            frameRect.origin.x = widthadd;
            if(nofcols==1)
                frameRect.origin.x = 175;
            
            temp.frame =frameRect;
            widthadd+=width+50;
            }
        }
        widthadd =50;
        heightadd+= height+50;
        
    }
        imagescroll.contentSize=CGSizeMake(768,nofrows*(height+50));
        CFShow(imagescroll);
       

    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
