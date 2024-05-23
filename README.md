# DailyValueCalculator

Simple calculator for nutrient amounts given a known % Daily Value.

## Inspiration

I started tracking my nutrition with [MacroFactor](https://macrofactorapp.com/) and discovered that, when creating new foods and inputting their nutrition information, I could only submit nutrient values in their numerical form (e.g. 0.1mg) rather than as a %DV - which was sometimes all that was listed on a nutrition label.

I began using this [DailyValueCalculator](https://dailyvaluecalculator.netlify.app/) to assist calculating the numerical value based on a given %DV but discovered that, unfortunately, it's based on Canadian nutrition labeling standards - which differ slightly from US standards.

So I figured: what better way to dip my toes into Flutter than by creating a simple app based on this website using data from the FDA?

FDA data source: https://www.fda.gov/food/nutrition-facts-label/daily-value-nutrition-and-supplement-facts-labels
