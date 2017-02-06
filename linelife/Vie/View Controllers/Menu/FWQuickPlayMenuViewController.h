//
// Created by Fabien Warniez on 2014-09-01.
// Copyright (c) 2014 Fabien Warniez. All rights reserved.
//

#import "FWTitleBar.h"

@class FWQuickPlayMenuViewController;
@class FWColorSchemeModel;
@class FWBoardSizeModel;
@class FWGameSettingsViewController;
@class FWMenuTile;

@protocol FWQuickPlayMenuControllerDelegate

- (void)quickPlayMenuDidClose:(FWQuickPlayMenuViewController *)quickPlayMenuViewController;
- (void)quickPlayMenuDidQuit:(FWQuickPlayMenuViewController *)quickPlayMenuViewController;
- (void)quickPlayMenuDidRestart:(FWQuickPlayMenuViewController *)quickPlayMenuViewController;
- (void)quickPlayMenu:(FWQuickPlayMenuViewController *)quickPlayMenuViewController didSaveWithName:(NSString *)name;
- (void)quickPlayMenu:(FWQuickPlayMenuViewController *)quickPlayMenuViewController colorSchemeDidChange:(FWColorSchemeModel *)colorScheme;
- (void)quickPlayMenu:(FWQuickPlayMenuViewController *)quickPlayMenuViewController boardSizeDidChange:(FWBoardSizeModel *)boardSize;
- (void)quickPlayMenu:(FWQuickPlayMenuViewController *)quickPlayMenuViewController gameSpeedDidChange:(NSUInteger)gameSpeed;

@end

@interface FWQuickPlayMenuViewController : UIViewController <FWTitleBarDelegate>

@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, weak) id<FWQuickPlayMenuControllerDelegate> delegate;

@end