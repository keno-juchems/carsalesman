% Loads the image files for display. 
img_animal    = {};
for i = 1:params.n_bandits
    image = imread(['data',filesep,'images',filesep,sprintf('%s.png',num2str(params.stim_shapes(i)))]);
    image(image > 127) = 255;
    image(image <=127) = 0;
    img_animal{i} = 255-image;
    img_animal{i}(img_animal{i} > 0) = 255;
    img_animal{i}(img_animal{i} < 255) = params.psych_background_black(1);
    img_textures{i} = Screen('MakeTexture',w,img_animal{i});
end

clear image;