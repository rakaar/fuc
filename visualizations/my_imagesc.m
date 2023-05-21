% Imagesc of a matrix with a colorbar
% my_imagesc(A, 'title', 'x_dir_label', 'y_dir_label')

function my_imagesc(A, title_str, x_label, y_label)
	figure
		imagesc(A)
		colorbar
		title(title_str)
		xlabel(y_label)
		ylabel(x_label)
end
