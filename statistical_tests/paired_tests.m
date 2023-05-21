% Performs Paired t-test, Wilcoxon signed rank test, both one-tailed and two-tailed
% paired_tests(x,y)
function paired_tests(x,y)

disp('---Paired tests---')
disp(['Mean of x: ', num2str(mean(x))])
disp(['Mean of y: ', num2str(mean(y))])

test_names = {"t-test"; "t-test:Right Tail(x>y)"; "t-test:Left Tail(x<y)" ;"Wilcoxon signed rank test"; "signrank:Right Tail(x>y)"; "signrank:Left Tail(x<y)"};

[h1,p1] = ttest(x,y);
[h2,p2] = ttest(x,y,'Tail','right');
[h3,p3] = ttest(x,y,'Tail','left');
[p4,h4] = signrank(x,y);
[p5,h5] = signrank(x,y,'Tail','right');
[p6,h6] = signrank(x,y,'Tail','left');

h_vals = [h1;h2;h3;h4;h5;h6];
p_vals = [p1;p2;p3;p4;p5;p6];

T = table(test_names, h_vals, p_vals, 'VariableNames', {'Test', 'h-value', 'p-value'});

disp(T)
end

