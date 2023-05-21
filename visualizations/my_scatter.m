% Scatter plot and compute correlation coefficient
% my_scatter(rand(1,10), rand(1,10), 'Example Title', 'X label', 'Y label')
function my_scatter(x, y, title_str, x_label, y_label)
	figure
		scatter(x,y,'filled');
		xlabel(x_label);
		ylabel(y_label);

		r = corrcoef(x,y);
		title(strcat(title_str, '-Correlation Coefficient= ', num2str(r(1,2))));	
end
