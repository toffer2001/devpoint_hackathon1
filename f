
[1mFrom:[0m C:/Users/KristofferKeene/Dropbox/Personal/DevPointLabs/hackathon1/devpoint_hackathon1/app/controllers/comments_controller.rb @ line 18 CommentsController#create:

    [1;34m17[0m: [32mdef[0m [1;34mcreate[0m
 => [1;34m18[0m:   binding.pry
    [1;34m19[0m:   @comment = @movie.comments.create(comment_params)
    [1;34m20[0m: 
    [1;34m21[0m:   [32mif[0m @comment.save
    [1;34m22[0m:     redirect_to movie_path(@movie)
    [1;34m23[0m:   [32melse[0m
    [1;34m24[0m:     render [33m:new[0m
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: [32mend[0m

