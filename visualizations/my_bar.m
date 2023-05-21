% Bar graph with mean and SEM
% my_bar(rand(10,1), 'title', 'x label', 'y label')
function my_bar(data, title_str, x_label, y_label)
	figure
		bar(data)
		title(title_str)
		xlabel(x_label)
		ylabel(y_label)
end
