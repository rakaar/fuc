
% Generate some sample data
data = randn(100,1);  

% Perform the Lilliefors test
[h,p] = lillietest(data);

% Display the results
if h == 0
    disp('Do not reject null hypothesis at 5% significance level. Data seems to be normally distributed.')
else
    disp('Reject null hypothesis at 5% significance level. Data does not seem to be normally distributed.')
end
disp(['p-value = ', num2str(p)]);


% Generate some sample data
data = randn(100,1);  

% Perform the Anderson-Darling test
[h,p] = adtest(data);

% Display the results
if h == 0
    disp('Do not reject null hypothesis at 5% significance level. Data seems to be normally distributed.')
else
    disp('Reject null hypothesis at 5% significance level. Data does not seem to be normally distributed.')
end
disp(['p-value = ', num2str(p)]);


% Generate some sample data
data = randn(100,1);  

% Perform the Jarque-Bera test
[h,p] = jbtest(data);

% Display the results
if h == 0
    disp('Do not reject null hypothesis at 5% significance level. Data seems to be normally distributed.')
else
    disp('Reject null hypothesis at 5% significance level. Data does not seem to be normally distributed.')
end
disp(['p-value = ', num2str(p)]);
