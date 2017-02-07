//
// Created by Fabien Warniez on 2014-08-31.
// Copyright (c) 2014 Fabien Warniez. All rights reserved.
//

@class FWUnlockViewController;

@protocol FWUnlockViewControllerDelegate

- (void)unlockItem1ButtonTapped:(FWUnlockViewController *)unlockViewController;
- (void)unlockItem2ButtonTapped:(FWUnlockViewController *)unlockViewController;
- (void)unlockItem3ButtonTapped:(FWUnlockViewController *)unlockViewController;
- (void)unlockItem4ButtonTapped:(FWUnlockViewController *)unlockViewController;

@end

@interface FWUnlockViewController : UIViewController

@property (nonatomic, weak) id<FWUnlockViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) IBOutlet UIImageView *logoImageView;

@end
