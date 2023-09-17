function duck = find_the_duck(I)
    B = squeeze(I(:, :, 1));
	duck = B > 60;
end