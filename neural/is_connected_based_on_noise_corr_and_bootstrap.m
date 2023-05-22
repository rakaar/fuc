% Returns if 2 neurons are connected or not based on noise correlation and bootsrapping
% is_connected = is_connected_based_on_noise_correlation_and_bootstrap(noise_vec1, noise_vec2, confidence)
function is_connected = is_connected_based_on_noise_correlation_and_bootstrap(noise_vec1, noise_vec2, confidence)
	% Parameters
	% noise_vec1, noise_vec2: noise vectors of 2 neurons
	% confidence: confidence level for bootstrap
	% Returns
	% 1 or 0: 1 if connected, 0 if not connected

	% Bootstrap
	n_boots = 1000;
	boot_noise_corr = zeros(n_boots, 1);
	chance_noise_corr = zeros(n_boots, 1);
	for boot=1:n_boots
		% Generate random indices
		indices = randi(length(noise_vec1), length(noise_vec1), 1);
		noise_vec1_shuff = noise_vec1(indices);
		noise_vec2_shuff = noise_vec2(indices);
		corrmat = corrcoef(noise_vec1_shuff, noise_vec2_shuff);
		boot_noise_corr(boot) = corrmat(1, 2);


		% Shuffle both the vectors now
		indices1 = randi(length(noise_vec1), length(noise_vec1), 1);
		indices2 = randi(length(noise_vec2), length(noise_vec2), 1);
		noise_vec1_shuff = noise_vec1(indices1);
		noise_vec2_shuff = noise_vec2(indices2);
		corrmat = corrcoef(noise_vec1_shuff, noise_vec2_shuff);
		chance_noise_corr(boot) = corrmat(1, 2);

	end

	boot_noise_corr_sort = sort(boot_noise_corr);
	chance_noise_corr_sort = sort(chance_noise_corr);

	% Calculate confidence interval based on confidence
	lower_bound = round((n_boots * ((100 - confidence) / 2)) / 100 + 1);
	upper_bound = round((n_boots * ((100 + confidence) / 2)) / 100);

	% Check if bootstrapped confidence interval is greater than chance confidence interval or not
	boot_ci = [boot_noise_corr_sort(lower_bound), boot_noise_corr_sort(upper_bound)];
	chance_ci = [chance_noise_corr_sort(lower_bound), chance_noise_corr_sort(upper_bound)];

	if boot_ci(1) > chance_ci(2)
		is_connected = 1;
	else
		is_connected = 0;
	end

end
