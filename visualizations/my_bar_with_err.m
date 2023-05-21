% Bar graph with mean and SEM
% my_bar_with_err(rand(10,3), 'title', 'x label', 'y label')
function my_bar_with_err(data, title_str, x_label, y_label)
	mean_data = mean(data);
	sem_data = std(data) ./ sqrt(size(data,1));
	figure
		bar(mean_data)
		hold on
			errorbar(mean_data, sem_data, '.')
		hold off
		title(title_str)
		xlabel(x_label)
		ylabel(y_label)
end
