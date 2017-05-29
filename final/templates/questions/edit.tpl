{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

<div class="container">
    <div class="row edit_prof">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

            <!-- TODO -->

            <form enctype="multipart/form-data" action="" method="post" role="form" class="register well text-center">
                <h2>Update your Question</h2>
                <hr class="colorgraph">
                <input type="hidden" name="id" value="{$questionId}">
                <div class="form-group">
                    <input type="text" name="questiontitle" class="form-control input-lg" value="{$question.title}" tabindex="4">
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <textarea name="questiondescription" rows="6" cols="100" class="form-control input-lg" value="{$question.description}"></textarea>
                        </div>
                    </div>
                </div>

                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-12 col-md-12"><input type="submit" name="submited" value="Update" class="btn btn-primary btn-block btn-lg btn-warning" tabindex="7"></div>
                </div>

                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
