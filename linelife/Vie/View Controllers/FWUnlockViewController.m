//
// Created by Fabien Warniez on 2014-08-31.
// Copyright (c) 2014 Fabien Warniez. All rights reserved.
//

#import "FWUnlockViewController.h"
#import "UIColor+FWAppColors.h"
#import "UIFont+FWAppFonts.h"
#import "UIView+FWConvenience.h"

@interface FWUnlockViewController ()

@property (nonatomic, strong) UIButton *unlockItem1Button;
@property (nonatomic, strong) UIButton *unlockItem2Button;
@property (nonatomic, strong) UIButton *unlockItem3Button;
@property (nonatomic, strong) UIButton *unlockItem4Button;
@property (nonatomic, strong) UILabel *copyrightLabel;

@property (nonatomic, assign) BOOL areFirstLoadAnimationsExecuted;

@end

@implementation FWUnlockViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _areFirstLoadAnimationsExecuted = NO;
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    self.unlockItem1Button = [FWUnlockViewController createMenuButtonWithTitle:NSLocalizedString(@"unlock.item1", @"6元 解锁30个模板")];
    self.unlockItem2Button = [FWUnlockViewController createMenuButtonWithTitle:NSLocalizedString(@"unlock.item2", @"12元 解锁90+30(额外赠送)个模板")];
    self.unlockItem3Button = [FWUnlockViewController createMenuButtonWithTitle:NSLocalizedString(@"unlock.item3", @"24元 解锁240+120(额外赠送)个模板")];
    self.unlockItem4Button = [FWUnlockViewController createMenuButtonWithTitle:NSLocalizedString(@"unlock.item4", @"48元 解锁500+360(额外赠送)个模板")];

    [self.unlockItem1Button addTarget:self action:@selector(unlockItem1ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.unlockItem2Button addTarget:self action:@selector(unlockItem2ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.unlockItem3Button addTarget:self action:@selector(unlockItem3ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.unlockItem4Button addTarget:self action:@selector(unlockItem4ButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.copyrightLabel = [[UILabel alloc] init];
    self.copyrightLabel.text = NSLocalizedString(@"launch.copyright", @"© 2017 mengyoutu.cn");
    self.copyrightLabel.font = [UIFont tinyBold];
    self.copyrightLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.unlockItem1Button];
    [self.view addSubview:self.unlockItem2Button];
    [self.view addSubview:self.unlockItem3Button];
    [self.view addSubview:self.unlockItem4Button];
    [self.view addSubview:self.copyrightLabel];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.copyrightLabel sizeToFit];
    CGRect copyrightFrame = self.copyrightLabel.frame;
    copyrightFrame.origin.x = FWRoundFloat((self.view.bounds.size.width - copyrightFrame.size.width) / 2.0f);
    copyrightFrame.origin.y = self.view.bounds.size.height - copyrightFrame.size.height - 12.0f;
    self.copyrightLabel.frame = copyrightFrame;
    
    NSArray *buttons = @[self.unlockItem1Button, self.unlockItem2Button, self.unlockItem3Button, self.unlockItem4Button];
    CGFloat availableHeight = self.copyrightLabel.frame.origin.y - CGRectGetMaxY(self.logoImageView.frame);
    CGFloat buttonSpacing = [UIView verticalSpaceToDistributeViews:buttons inAvailableVerticalSpace:availableHeight];
    [UIView distributeVerticallyViews:buttons
                      startingAtPoint:CGPointMake(FWRoundFloat(self.view.bounds.size.width / 2.0f), CGRectGetMaxY(self.logoImageView.frame) + buttonSpacing)
                          withSpacing:buttonSpacing];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    if (!self.areFirstLoadAnimationsExecuted)
    {
        [self animateItems];
        self.areFirstLoadAnimationsExecuted = YES;
    }
}

#pragma mark - Private Methods

- (void)animateItems
{
    [self.logoImageView slideTo:[self.logoImageView frameWithY:50.0f] duration:0.7f delay:0.4f completion:nil];
    [self.unlockItem1Button fadeInWithDuration:0.5f delay:1.0f];
    [self.unlockItem2Button fadeInWithDuration:0.5f delay:1.0f];
    [self.unlockItem3Button fadeInWithDuration:0.5f delay:1.0f];
    [self.unlockItem4Button fadeInWithDuration:0.5f delay:1.0f];
}

- (void)unlockItem1ButtonTapped:(UIButton *)quickGameButton
{
    //[self.delegate quickGameButtonTappedForLaunchScreen:self];
}

- (void)unlockItem2ButtonTapped:(UIButton *)patternsButton
{
    //[self.delegate patternsButtonTappedForLaunchScreen:self];
}

- (void)unlockItem3ButtonTapped:(UIButton *)savedGamesButton
{
    //[self.delegate savedGamesButtonTappedForLaunchScreen:self];
}

- (void)unlockItem4ButtonTapped:(UIButton *)aboutButton
{
    //[self.delegate aboutButtonTappedForLaunchScreen:self];
}

+ (UIButton *)createMenuButtonWithTitle:(NSString *)title
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton.titleLabel setFont:[UIFont largeBold]];
    [newButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor lightGrey] forState:UIControlStateHighlighted];
    newButton.alpha = 0.0f;
    newButton.frame = CGRectMake(0.0f, 0.0f, 300.0f, 30.0f);
    newButton.autoresizingMask =
            UIViewAutoresizingFlexibleTopMargin
                    | UIViewAutoresizingFlexibleRightMargin
                    | UIViewAutoresizingFlexibleBottomMargin
                    | UIViewAutoresizingFlexibleLeftMargin;
    return newButton;
}

@end
