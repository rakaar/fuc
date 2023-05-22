%  INCOMPLETE - need to decide on threshold - Calculate timing of first spike due to stimulus(distinguish stimulus-driven spike from spontaneous spike), based on Chase & Young, 2007, PNAS
% time = first_spike_due_to_stimulus(spike_data, spontaneous_rate)

function time = first_spike_due_to_stimulus(spike_data, spontaneous_rate)
	% Distinguish stimulus-driven spike from spontaneous spike
	% Args:
	% spike_data: spike data of a single neuron for a stimulus all iters
	% spontaneous_rate: spontaneous rate of the neuron
	% Returns:
	% time: time of first spike due to stimulus in ms

	% collapse all iters into one vector using OR gate
	time = nan;

	p1 = [];
	p2 = [];
	n_iters = size(spike_data, 1);
	total_time = size(spike_data, 2);
	collapsed_spikes = zeros(1, total_time);
	for iter = 1:n_iters
		collapsed_spikes = collapsed_spikes | spike_data(iter, :);
	end
figure
	stem(collapsed_spikes);
	% use poisson statistics to calculate probability of 'n' spikes
	for tn = 5:total_time
		n_spikes = sum(collapsed_spikes(1:tn));
		disp([tn,n_spikes])		
		% Calculate prob of n spikes in tn window
		prob_of_n_spikes = 0;
		N_lamda_tn = n_iters*spontaneous_rate*tn;
		for m = 0:n_spikes-1
			prob_of_n_spikes = prob_of_n_spikes +  ( ( (N_lamda_tn)^m )*exp(-N_lamda_tn) )/factorial(m);
		end
		

		% prob of atleast n_spikes is greater than 1e-6 (1e-6 according to paper)
		prob_of_atleast_n_spikes = 1 - prob_of_n_spikes;
		p1 = [p1 prob_of_n_spikes];
		p2 = [p2 prob_of_atleast_n_spikes];
		disp([prob_of_n_spikes, prob_of_atleast_n_spikes])
		if prob_of_atleast_n_spikes < 1e-6
			time = tn;
			break;
		end
	end


		figure
			plot(p1)
		figure
			plot(p2)

end
