---
layout: project-top
title: "List with Indicator - Dynamic"
description: "<strong>List with Indicator - Dynamic</strong>"
extract: "This widget possesses dynamic capabilities, allowing you to use a data source with it."
weight: 3
thumbnail: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicPublishedMode.png"
image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicPublishedMode.png"
categories: ["Widget", "Dynamic"]
contributor: "XMPro"
role: "Pattern"
import_password: Dem0nstr@t1on
toc: false
toc_label: 

gallery:
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicPublishedMode.png"
    caption: "<strong>Above:</strong> Published View Dark Theme"
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/LightTheme/ListwithIndicatorDynamicPublishedMode.png"
    caption: "<strong>Above:</strong> Published View Light Theme"
gallery_limit: 2

side_gallery:
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicDesignMode.png"
    caption: "<strong>Above:</strong> Design Mode"
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicDataSource.png"
    caption: "<strong>Above:</strong> Design Mode - Data Source"
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/LightTheme/ListwithIndicatorDynamicDesignMode.png"
    caption: "<strong>Above:</strong> Design Mode"
  - image: "/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/LightTheme/ListwithIndicatorDynamicDataSource.png"
    caption: "<strong>Above:</strong> Design Mode - Data Source"

files:
  - title: "Widget"
    link: "https://github.com/XMPro/Blueprints-Accelerators-Patterns/blob/master/Patterns/Widgets/List%20with%20Indicator%20Dynamic.xwid"
    image: "/assets/images/icons/AD.png"
---

## App Designer Widget
This widget possesses dynamic capabilities, allowing you to use a data source with it. Once you do so, it will automatically present the data with their corresponding values. Notably, the rows within the widget will adjust automatically in accordance with the data source you have loaded.

The widget is configured using: 

| Block                                  | Description                                                  |
| -------------------------------------- | ------------------------------------------------------------ |
| [Indicator](https://documentation.xmpro.com/blocks-toolbox/basic/indicator) | To visually indicate the active state of the assets |
| [Text](https://documentation.xmpro.com/blocks-toolbox/basic/text) | To display the live data |

<br />
To configure and use the total section, select the box named *__Total Data Source__* and configure its data source under *Block Properties*.  
<div class="inline_image">{% include framework/shortcodes/image.html src="/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/DarkTheme/ListwithIndicatorDynamicDataSource.png" %}</div>
<div class="inline_image">{% include framework/shortcodes/image.html src="/assets/images/Patterns/Widgets/ListwithIndicatorDynamic/LightTheme/ListwithIndicatorDynamicDataSource.png" %}</div>
Make sure to change the fields within the box to get their values from the data source vs static.

How this works is for every row returned in the data source it will create that many child sections.  If you have 4 it will create 4, if you have 3 it will create 3 etc.