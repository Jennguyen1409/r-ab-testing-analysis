# A/B Testing Analysis in R

## Project Overview
Analyzed landing page A/B test results using R to determine if a new page design increased conversions.

## Dataset
- **Total users:** 294,478
- **Control group (old page):** 147,202 users
- **Treatment group (new page):** 147,276 users

## Results

| Group | Conversions | Conversion Rate |
|-------|-------------|-----------------|
| Control (Old Page) | 17,723 | 12.04% |
| Treatment (New Page) | 17,514 | 11.89% |

## Statistical Test
- **Test:** Two-proportion z-test
- **P-value:** 0.2161
- **Conclusion:** No statistically significant difference (p > 0.05)

## Business Recommendation
Do not launch the new landing page. The old page performs equally well.

## Files in This Repository
- `ab_testing_analysis.R` - Complete R script with analysis code
- `ab_test_chart.png` - Bar chart visualization of results

## Tools Used
- R
- prop.test() for two-proportion z-test
- Base R graphics for visualization

## Skills Demonstrated
- A/B testing
- Hypothesis testing
- Statistical significance
- Data visualization in R
