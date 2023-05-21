% For a matrix, column wise - Mean and Median with error bars
% my_plot(1:10, rand(5,10), 'Example Title', 'X label', 'Y label')
function my_plot(x_axis,data, plot_title, x_label, y_label)
	% Given a matrix, across columns, take mean and median with error bars
	% Args
	%	x_axis: vector
	%	data: matrix
	%	plot_title: string
	%	x_label: string
	%	y_label: string
	% Returns
	%	plot with mean and median with error bars

	mean_data = mean(data,1);
	std_data = std(data,1);
	standard_error_mean = std_data./sqrt(size(data,1));

	median_data = median(data,1);
	mean_absolute_dev = mad(data,1);

	figure
		hold on
			errorbar(x_axis, mean_data, standard_error_mean);
			errorbar(x_axis, median_data, mean_absolute_dev);
		hold off
		title(plot_title)
		xlabel(x_label)
		ylabel(y_label)
		legend('mean with SEM', 'median with MAD')
end
