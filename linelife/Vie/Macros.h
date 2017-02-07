//
// Created by Fabien Warniez on 2015-03-22.
// Copyright (c) 2015 Fabien Warniez. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define FWRoundFloat(x) floorf([UIScreen mainScreen].scale * x) / [UIScreen mainScreen].scale
#define FWDegreesToRadians(x) x * M_PI / 180.0f
#define ISNULL(x) (x?((id)x==(id)[NSNull null]):true)

#define LINE_LIFE_ITEM1 @"linelifeitem1"
#define LINE_LIFE_ITEM2 @"linelifeitem2"
#define LINE_LIFE_ITEM3 @"linelifeitem3"
#define LINE_LIFE_ITEM4 @"linelifeitem4"
#endif
