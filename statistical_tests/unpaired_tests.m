% Performs Unpaired t-test(2 & 1 tailed), Wilcoxon rank sum test(2 & 1 tailed), Kolmogorov-Smirnov test,F-test
% unpaired_tests(x,y)
function unpaired_tests(x,y)

disp('---Unpaired tests---')
disp(['Mean of x: ', num2str(mean(x))])
disp(['Mean of y: ', num2str(mean(y))])

test_names = {'t-test'; 't-test:Right-tailed(x>y)'; 't-test:Left-tailed(x<y)'; 'Wilcoxon rank sum test'; 'ranksum:Right-tailed(x>y)'; 'ranksum:Left-tailed(x<y)';'Kolmogorov-Smirnov test'; 'F-test'};

[h1,p1] = ttest2(x,y);
[h2,p2] = ttest2(x,y,'Tail','right');
[h3,p3] = ttest2(x,y,'Tail','left');
[p4,h4] = ranksum(x,y);
[p5,h5] = ranksum(x,y,'Tail','right');
[p6,h6] = ranksum(x,y,'Tail','left');
[h7,p7] = kstest2(x,y);
[h8,p8] = vartest2(x,y);

h_values = [h1;h2;h3;h4;h5;h6;h7;h8];
p_values = [p1;p2;p3;p4;p5;p6;p7;p8];

T = table(test_names, h_values, p_values, 'VariableNames',{'Test','h-value','p-value'});

disp(T)
end
