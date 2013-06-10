ShinobiCharts Tornado Chart (Objective-C)
=====================

A Tornado Chart is a special type of bar chart where the bars extend from a defined midpoint - known as the "base" value. With a small amount of customisation and calculation, building a Tornado Chart with ShinobiCharts is simple. This sample project shows the best way to implement Tornado Charts using Shinobi. There's an accompanying blog post [here](http://www.shinobicontrols.com/blog/posts/2013/06/04/building-a-tornado-chart/).

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiCharts/Grids/Essentials. If you don't have it yet, you can download a free trial from the [ShinobiCharts/Grids/Essentials website](link to appropriate section).

Once you've downloaded and unzipped ShinobiCharts/Grids/Essentials, open up the project in XCode, and drag ShinobiCharts/Grids/Essentials.embeddedframework from the finder into Xcode's 'frameworks' group, and XCode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up TornadoViewController.m and add the following line after the chart is initialised:

    _chart.licenseKey=@"your license key";

Contributing
------------

We use the Fork & Pull Model so if you want to contribute to this project, please go ahead and fork our repository, make your changes, then send us a pull request when you’d like us to take a look at your work.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

