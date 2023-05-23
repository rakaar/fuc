%  Calculate timing of first spike due to stimulus(distinguish stimulus-driven spike from spontaneous spike), based on Chase & Young, 2007, PNAS
% time = first_spike_due_to_stimulus(spike_data, spontaneous_rate_in_sp_per_ms, threshold_probability_of_atleast_n_spikes)

function time = first_spike_due_to_stimulus(spike_data, spontaneous_rate, threshold_prob_of_atleast_n_spikes)
	% Distinguish stimulus-driven spike from spontaneous spike
	% Args:
	% spike_data: spike data of a single neuron for a stimulus all iters
	% spontaneous_rate: spontaneous rate of the neuron in spikes/ms
	% threshold_prob_of_atleast_n_spikes: 1e-6 as per paper
	% Returns:
	% time: time of first spike due to stimulus in ms


	% Initialize time to nan
	time =  nan;
	% collapse all iters into one vector using OR gate
	n_iters = size(spike_data, 1);
	total_time = size(spike_data, 2);
	collapsed_spikes = zeros(1, total_time);
	for iter = 1:n_iters
		collapsed_spikes = collapsed_spikes | spike_data(iter, :);
	end

	figure
		stem(collapsed_spikes);
		title('Collapsed spikes');

	% use poisson statistics to calculate probability of 'n' spikes
	arr_prob_of_atleast_n_spikes = [];
	for tn = 5:total_time
		n_spikes = sum(collapsed_spikes(1:tn));
		% Calculate prob of n spikes in tn window
		prob_of_n_spikes = 0;
		N_lamda_tn = n_iters*spontaneous_rate*tn;
		for m = 0:n_spikes-1
			prob_of_n_spikes = prob_of_n_spikes +  ( ( (N_lamda_tn)^m )*exp(-N_lamda_tn) )/factorial(m);
		end
		

		% prob of atleast n_spikes is greater than 1e-6 (1e-6 according to paper)
		prob_of_atleast_n_spikes = 1 - prob_of_n_spikes;
		arr_prob_of_atleast_n_spikes = [arr_prob_of_atleast_n_spikes, prob_of_atleast_n_spikes];
		if prob_of_atleast_n_spikes < threshold_prob_of_atleast_n_spikes 
			time = tn;
			break;
		end
	end


		figure
			plot(arr_prob_of_atleast_n_spikes)
			title('Prob of atleast n spikes')

end
