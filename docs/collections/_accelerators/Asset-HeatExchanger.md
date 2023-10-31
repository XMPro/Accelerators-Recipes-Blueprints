---
layout: project-top
date: 2023-10-30
title: "Asset - Heat Exchanger View"
description: "<strong>Asset - Heat Exchanger View</strong>"
extract: "A live-data application for a heat exchanger asset, displaying metrics, usage profile, operational safety intelligence, historical data, and recommendations."
weight: 4
thumbnail: "/assets/images/Accelerators/assets/heat-exchanger/Application.png"
image: "/assets/images/Accelerators/assets/heat-exchanger/Application.png"
categories: ["Asset Monitoring","Condition Monitoring","Dark Theme"]
contributor: "XMPro"
role: "Accelerator"
import_password: Dem0nstr@t1on
toc: true
toc_label: "Table of Contents"

gallery:
  - image: "/assets/images/Accelerators/assets/heat-exchanger/Application.gif"
    caption: 
  - image: "/assets/images/Accelerators/assets/heat-exchanger/Running Data Stream.png"
    caption: "<strong>Above:</strong> Published Data Stream"
gallery_limit: 2

side_gallery:
  - image: 
    caption: 

files:
  - title: "Application"
    link: "https://github.com/XMPro/Accelerators-Recipes-Blueprints/blob/master/Accelerators/Assets/Heat%20Exchanger%20View/Application/Heat%20Exchanger%20View.xapp"
    image: "/assets/images/icons/AD.png"
  - title: "Application Template"
    link: "https://github.com/XMPro/Accelerators-Recipes-Blueprints/blob/master/Accelerators/Assets/Heat%20Exchanger%20View/Template/Heat%20Exchanger%20View.xtml"
    image: "/assets/images/icons/AD.png"    
  - title: "Recommendation - Fouling"
    link: "https://github.com/XMPro/Blueprints-Accelerators-Patterns/blob/master/Accelerators/Assets/Heat%20Exchanger%20View/Recommendation/Heat%20Exchanger%20Fouling.xr"
    image: "/assets/images/icons/RM.png"
  - title: "Data Stream - Heat Exchanger Telemetry"
    link: "https://github.com/XMPro/Accelerators-Recipes-Blueprints/blob/master/Accelerators/Assets/Heat%20Exchanger%20View/Data%20Stream/Simulate%20Heat%20Exchanger%20Telemetry.xuc"
    image: "/assets/images/icons/DS.png"
  - title: "SQL - UCoefficient"
    link: "https://github.com/XMPro/Blueprints-Accelerators-Patterns/blob/master/Accelerators/Assets/Heat%20Exchanger%20View/SQL%20Scripts/%5BDemoHeatExchangerUCoefficient%5D.sql"
    image: "/assets/images/icons/sql.webp"
---

## Application
The application is configured using: 

| Block                                  | Description                                                  |
| -------------------------------------- | ------------------------------------------------------------ |
| [Text](https://documentation.xmpro.com/blocks-toolbox/basic/text) | Text to display the live data on the schematic |
| [Circular Gauge](https://documentation.xmpro.com/blocks-toolbox/visualizations/circular-gauge) | To show the effective utilization percentage |
| [Recommendations](https://documentation.xmpro.com/blocks-toolbox/recommendations/recommendations) | To view current open recommendations for the specific asset |
| [Indicator](https://documentation.xmpro.com/blocks-toolbox/basic/indicator) | To visually indicate the active state of the asset |
| [Chart](https://documentation.xmpro.com/blocks-toolbox/visualizations/chart) | A horizontal bar graph to the time profile for this asset, as well as the U Coefficient |

## Data Stream
The data stream is configured using: 

| Agent                                  | Description                                                  |
| -------------------------------------- | ------------------------------------------------------------ |
| [Event Simulator](https://xmpro.gitbook.io/event-simulator/) | Simulates the data within the thresholds configured |
| [Calculated Field](https://xmpro.gitbook.io/calculated-field/) | Adding an AssetId |
| [Broadcast](https://xmpro.gitbook.io/broadcast/) | Broadcast data to other agents |
| [Round](https://xmpro.gitbook.io/rounding/) | Rounding all values |
| [XMPro App](https://xmpro.gitbook.io/xmpro-app/) | View data in the App Designer |
| [Run Recommendation](https://xmpro.gitbook.io/run-recommendation/) | Pass the data to the Recommendation engine to evaluate |

## Steps to Import

### 1. Create/confirm variables
Ensure the following variables are available to be used in the data stream:

- App Designer URL
- App Designer Integration Key <strong>(Encrypted)</strong>
- SQL Server
- SQL Username
- SQL Password <strong>(Encrypted)</strong>

### 2. Run SQL Scripts
- Execute the scripts in SQL Server
- Ensure the data is successfully loaded into the database 

### 3. Import the Data Stream

- Select the highest agent version number on import, if prompted
- Assign Access to others as required
- <strong>XMPro agents</strong> ({% include framework/shortcodes/image.html width="14px" height="14px" src="/assets/images/icons/xmpro_app.webp" %}) - ensure the URL & Integration Key are selected
- <strong>Recommendation agent</strong> ({% include framework/shortcodes/image.html width="14px" height="14px" src="/assets/images/icons/run_recommendation.webp" %}) - ensure the URL & Integration Key are selected
- <strong>SQL agent</strong> ({% include framework/shortcodes/image.html width="14px" height="14px" src="/assets/images/icons/sql.webp" %}) - ensure the Instance, Username & Password fields are filled in
- Click Apply and save the data stream
- Publish the data stream and open the live view
- Ensure there is data in the live view by monitoring the agents

### 4. Import the Recommendations
- Mark the included form if it doesn't already exist and map the data stream to import
  {% include framework/shortcodes/image.html src="/assets/images/Accelerators/assets/heat-exchanger/Recommendation_Import.png" %}
- Assign Access to others as required
  {% include framework/shortcodes/image.html src="/assets/images/Accelerators/assets/heat-exchanger/Recommendation_Access.png" %}

### 5. Import the Application

- Map the data source on import:
  - Landing Page:

  | Data Source Name | Data Stream | Agent Option |
  | ---------------- | ----------- | ------------ |
  | Telemetry | Simulate Heat Exchanger Telemetry | Send to App Designer |

  {% include framework/shortcodes/image.html src="/assets/images/Accelerators/assets/heat-exchanger/Application_Import.png" %}

- Assign Access to others as required
  {% include framework/shortcodes/image.html src="/assets/images/Accelerators/assets/heat-exchanger/Application_Access.png" %}
- Ensure the App Data connection properties are configured and valid
- Edit the application to link the recommendations (Select *__Heat Exchanger Fouling__* in Block Properties under Behavior)

  | Page | Location | 
  | ----------- | ----------- |
  | Landing Page | Center Right |

- Save the application
- Publish the application
- Ensure there is data in the application by observing the values