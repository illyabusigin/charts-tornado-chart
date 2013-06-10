//
//  TornadoViewController.m
//  TornadoChart
//
//  Created by Chris Grant on 16/05/2013.
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "TornadoViewController.h"
#import "TornadoDataSource.h"

#define BASE @50

@implementation TornadoViewController {
    ShinobiChart *_chart;
    TornadoDataSource *_datasource;
    SChartAnnotation *_baseAnnotation;
}

-(id)init {
    self = [super init];
    if (self) {
        // Set up a new datasource and set the base point value - where the tornado is based.
        _datasource = [TornadoDataSource new];
        [_datasource setBase:BASE];
        
        // The data for the datasource is added in the "init" method of the TornadoDataSource.
        // You can specify your own data by removing that and setting "_datasource.data".
        // This must be an array of "TornadoDataPoint" objects.
        // _datasource.data = mydata;
        
        [_chart reloadData];
        [_chart redrawChart];
        
        // Build a new chart.
        _chart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
        [_chart setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [_chart setDatasource:_datasource];
        [self.view addSubview:_chart];
        
        // Set up the chart's axes.
        _chart.xAxis = [SChartNumberAxis new];
        [_chart.xAxis setEnableGesturePanning:YES];
        [_chart.xAxis setEnableGestureZooming:YES];
        [_chart.xAxis setEnableMomentumPanning:YES];
        [_chart.xAxis setEnableMomentumZooming:YES];
        [_chart.xAxis setAxisPosition:SChartAxisPositionReverse]; // This puts the X-Axis at the top of the chart.
        
        _chart.yAxis = [SChartCategoryAxis new];

        // Add an annotation to act as the base point of the tornado chart
        _baseAnnotation = [SChartAnnotation verticalLineAtPosition:BASE
                                                         withXAxis:_chart.xAxis
                                                          andYAxis:_chart.yAxis
                                                         withWidth:2.0
                                                         withColor:_chart.plotAreaBorderColor];
        [_chart addAnnotation:_baseAnnotation];

        // Set the default range on the chart so the data is visible (This is necessary otherwise there would be no
        // space on the right hand side of the tornado bars.
        SChartNumberRange *range = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@100];
        [[_chart xAxis] setDefaultRange:range];
    }
    return self;
}

@end