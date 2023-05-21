% Box plot of matrix column wise
% my_boxplot(rand(10,3), 'title', 'x_label', 'y_label')
function my_boxplot(data, title_str, x_label, y_label)
	figure
		boxplot(data)
		title(title_str)
		xlabel(x_label)
		ylabel(y_label)
end
