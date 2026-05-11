# London Housing Affordability, Spatial Inequality and Transport Accessibility

## Overview

This project investigates the spatial diffusion of housing affordability deterioration across London boroughs between 1997 and 2025 using Office for National Statistics (ONS) data and econometric analysis in R.

The analysis examines:
- borough-level affordability deterioration;
- spatial inequality across London;
- Crossrail connectivity and transport accessibility;
- the relationship between borough earnings and housing affordability change.

## Research Questions

- To what extent did housing affordability deteriorate across London boroughs between 1997 and 2025?
- Did historically lower-income boroughs experience stronger proportional affordability deterioration?
- Did Crossrail-connected boroughs experience significantly different affordability outcomes relative to non-Crossrail boroughs?

## Data Sources

- ONS Ratio of House Prices to Earnings by Borough
- ONS Earnings by Workplace, Borough

## Methodology

The project used:
- data cleaning and transformation in R;
- descriptive statistical analysis;
- borough-level affordability visualisation;
- time-series analysis;
- Welch two-sample t-tests;
- multivariable linear regression;
- spatial economic interpretation grounded in urban economics theory.

## Key Findings

- Housing affordability deteriorated substantially across London boroughs between 1997 and 2025.
- Historically lower-income boroughs experienced stronger proportional affordability deterioration.
- Affordability pressures increasingly diffused outward across London rather than remaining concentrated only in traditionally expensive central boroughs.
- Crossrail connectivity alone did not produce statistically significant differences in borough-level affordability deterioration.
- Median weekly earnings were statistically associated with affordability deterioration, suggesting an important spatial inequality dimension.

## Technical Skills Demonstrated

- R
- tidyverse
- ggplot2
- data cleaning
- data visualisation
- hypothesis testing
- regression modelling
- public economic data analysis
- GitHub documentation

## Repository Structure

```text
.
├── README.md
├── scripts/
│   └── housing_affordability_analysis.R
├── outputs/
│   ├── affordability_2025.png
│   ├── borough_affordability_trends.png
│   ├── percentage_change_affordability.png
│   └── crossrail_boxplot.png
└── report/
    └── housing_affordability_report.pdf
