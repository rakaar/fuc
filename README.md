# FUC (Frequently Used Codes)

## Neural
1. [Calculate Spiketime Tiling coefficient (STTC) between two spike trains](https://github.com/rakaar/fuc/blob/master/./neural/my_sttc.m). Usage: `sttc = my_sttc(spiketrain_a, spiketrain_b, dt)`

## Statistical tests
1. [Normality test - 0 = normal, 1 = not normal - Performs Lilliefors, Anderson-Darling, Jarque-Bera, and Shapiro-Wilk tests](https://github.com/rakaar/fuc/blob/master/./statistical_tests/normality_tests.m). Usage: `normality_tests(x)`
2. [Performs Paired t-test, Wilcoxon signed rank test, both one-tailed and two-tailed](https://github.com/rakaar/fuc/blob/master/./statistical_tests/paired_tests.m). Usage: `paired_tests(x,y)`
3. [Performs Unpaired t-test, Wilcoxon rank sum test, Kolmogorov-Smirnov test,F-test](https://github.com/rakaar/fuc/blob/master/./statistical_tests/unpaired_tests.m). Usage: `unpaired_tests(x,y)`

## Visualizations
1. [Scatter plot and compute correlation coefficient](https://github.com/rakaar/fuc/blob/master/./visualizations/my_scatter.m). Usage: `my_scatter(rand(1,10), rand(1,10), 'Example Title', 'X label', 'Y label')`
2. [Bar graph with mean and SEM](https://github.com/rakaar/fuc/blob/master/./visualizations/my_bar_with_err.m). Usage: `my_bar_with_err(rand(10,3), 'title', 'x label', 'y label')`
3. [Bar graph with mean and SEM](https://github.com/rakaar/fuc/blob/master/./visualizations/my_bar.m). Usage: `my_bar(rand(10,1), 'title', 'x label', 'y label')`
4. [Imagesc of a matrix with a colorbar](https://github.com/rakaar/fuc/blob/master/./visualizations/my_imagesc.m). Usage: `my_imagesc(A, 'title', 'x_dir_label', 'y_dir_label')`
5. [Box plot of matrix column wise](https://github.com/rakaar/fuc/blob/master/./visualizations/my_boxplot.m). Usage: `my_boxplot(rand(10,3), 'title', 'x_label', 'y_label')`
6. [For a matrix, column wise - Mean and Median with error bars](https://github.com/rakaar/fuc/blob/master/./visualizations/my_plot.m). Usage: `my_plot(1:10, rand(5,10), 'Example Title', 'X label', 'Y label')`
