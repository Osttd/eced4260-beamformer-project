load Student_data.mat


n = 8;
data = zeros(n,length(ind_dels(1, :)));

for n = [1:8]
    up_sample_data(n, :) = upsample(raw_data_full(n, :), f_up/f_adc);
    up_filter_data(n, :) = filter(b, 1, up_sample_data(n, :));

    i = 1

    for index = ind_dels(n, :)
        data_out(n,i) = up_filter_data(n, index);
        i = i+1;
    end
end

data_out_average = mean(data_out);
data_out_normal = normalize(data_out_average, "norm", 1);
finalized_image = transpose(mag2db(data_out_normal));

figure(1)
imagesc(finalized_image)
caxis([-60, 0])
colormap('gray')
colorbar();


