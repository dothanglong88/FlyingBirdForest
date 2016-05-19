//
//  ViewController.m
//  FlyingBirdForest
//
//  Created by Xmob - Longdt on 5/16/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView * bird;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawJungle];
    [self addBird];
    [self flyUpAndDown];
}

-(void) drawJungle{
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}

- (void) addBird{
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"]
                             ];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1; // t chay animate
    [self.view addSubview:bird];
    [bird startAnimating];
}

-(void) flyUpAndDown{
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    }completion:^(BOOL finished){
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1,1), CGAffineTransformMakeRotation(M_PI_4));
        
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        }completion:^ (BOOL finished){
            [self flyUpAndDown];
        }];
    }];
}

@end
