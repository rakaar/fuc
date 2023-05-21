% Calculate Spiketime Tiling coefficient (STTC) between two spike trains
% sttc = my_sttc(spiketrain_a, spiketrain_b, dt)
function sttc = my_sttc(spiketrain_a, spiketrain_b, dt)
    % spiketrain_a - array of 0s and 1s, 1ms bins
    % spiketrain_b - array of 0s and 1s, 1ms bins
    % dt - in ms

    ta = (length(spiketrain_a) - 2*dt)/length(spiketrain_a);
    tb = (length(spiketrain_b) - 2*dt)/length(spiketrain_b);

    % pa
    pa = 0;
    spiketrain_a_copy = spiketrain_a;
  
    for i=1:length(spiketrain_b)
        if spiketrain_b(i) == 1
            left_boundary = max(i-dt,1);
            right_boundary = min(i+dt,length(spiketrain_b));
    
            for j=left_boundary:right_boundary
                if spiketrain_a_copy(j) == 1
                    pa = pa + 1;
                    spiketrain_a_copy(j) = 0;
                end
            end
        end
    end

    pa = pa/sum(spiketrain_a);

    % pb
    pb = 0;
    spiketrain_b_copy = spiketrain_b;
  
    for i=1:length(spiketrain_a)
        if spiketrain_a(i) == 1
            left_boundary = max(i-dt,1);
            right_boundary = min(i+dt,length(spiketrain_a));
    
            for j=left_boundary:right_boundary
                if spiketrain_b_copy(j) == 1
                    pb = pb + 1;
                    spiketrain_b_copy(j) = 0;
                end
            end
        end
    end

    pb = pb/sum(spiketrain_b);

    % disp([ta,pa, tb,pb])
    % if isnan(pa) || isnan(pb)
    %     disp( [sum(spiketrain_a), sum(spiketrain_b)] )
    % end
    sttc = 0.5 * ( ( (pa - ta)/(1 - (pa*ta)) ) + ( (pb - tb)/(1 - (pb*tb)) ) );
end
