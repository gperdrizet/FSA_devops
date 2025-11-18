---
layout: post
title: "Lesson 15 demo update"
date: 2025-11-17
categories: resources
---

Made some updates to the Lesson 15: data wrangling demo notebook. Switched to the feature used for the outlier analysis section to `MedInc` rather than `MedHouseVal` - I think it gives more interesting and informative results. You can easily re-run the notebook with any feature you want to try it out. Just update the `missing_feature` and/or `outlier_feature` variables in the setup section at the start of the notebook. Also switched to using Scikit-learn's `KBinsDiscretizer` rather than `pd.cut()` for outlier binning. KBinsDiscretizer uses quantile binning - this is what we want, not equal size bins.
