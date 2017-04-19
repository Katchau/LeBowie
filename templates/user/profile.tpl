{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}
	
	<!-- profile area -->
    <div class="container profile">
      <div class="row">

        <div class="hidden-xs col-lg-8 media">
          <div class="profile-upper">
            <div class="profile-image-and-info">
              <img class="user_profile_pic2 img-thumbnail" src="img/profile.png" alt="user_image">
              <hr>
              <div class="profile-info">
                <span class="info-start">Email: </span>{$user.email}
                <br>
                <span class="info-start">Name: </span>{$user.first_name}
                <br>
                <span class="info-start">Surname: </span>{$user.last_name}
                <br>
                <span class="info-start">Country: </span>Rwanda
                <hr>
                <div class="profile-badges">
                  <span class="info-start">User Badges </span>
                  <br>
                  <span class="label label-default">2 years club</span>
                  <span class="label label-primary">200 questions</span>
                  <br>
                  <span class="label label-success">400 answers</span>
                  <span class="label label-info">10k user score </span>
                </div>
              </div>
              <hr>
              <div class="profile-down">
                <div class="profile-topics">
                  <label class="info-start">Most frequented topics</label> <br>
                  <ul class="">
                    <li><a href="#">Programming</a></li>
                    <li><a href="#">Cooking</a></li>
                    <li><a href="#">Science</a></li>
                    <li><a href="#">Mathematics</a></li>
                  </ul>
                </div>

              </div>
            </div>

            <div class="profile-user-and-desc">
              <div class="media-body profile-username">
                Joaquim João Mendes
              </div>
              <div class="profile-user-score">
                <span class="user_score"> 12.000 </span> user score
              </div>
              <hr>
              <div class="profile-desc">
                Responsible for Business Development within the Special District as well as Industry Recruitment on the Informatics area and helping existing business grow and expand.I report to a board of 7 Directors and sets the planning for the 8 thousand acre District when it concerns Incentives to large and small industry, tax planning for abatements and tax credits given as incentives.
              </div>
            </div>
          </div>

        </div>

        <div class="container hidden-sm hidden-md hidden-lg mobile_profile">
          <div class="profile-user-and-desc">
            <div class="row">
              <div class="col-xs-8">
                <div class="media-body profile-username">
                  Joaquim João Mendes
                </div>
                <div class="profile-user-score">
                  <span class="user_score"> 12.000 </span> user score
                </div>
              </div>
              <div class="col-xs-4 text-right">
                <img class="user_profile_pic2 img-thumbnail" src="img/profile.png" alt="user_image">
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-info">
                <span class="info-start">Email: </span>jjmendes@coldmail.com
                <br>
                <span class="info-start">Name: </span>Joaquim João
                <br>
                <span class="info-start">Surname: </span>Mendes
                <br>
                <span class="info-start">Country: </span>Rwanda
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-desc">
                Prism letterpress farm-to-table, food truck butcher seitan tilde tacos glossier affogato activated charcoal kombucha dreamcatcher. Copper mug wayfarers tumeric snackwave normcore, freegan kitsch organic humblebrag kickstarter hella quinoa skateboard. Jean shorts ethical pug, fashion axe wayfarers trust fund YOLO man bun live-edge af brunch mumblecore fam actually thundercats. Master cleanse VHS pork belly, flannel live-edge glossier man bun. Aesthetic celiac you probably haven't heard of them.

                <hr>
              </div>
            </div>

            <div class="row">
              <div class="col-xs-6 profile-badges">
                <span class="info-start">User Badges </span>
                <br>
                <span class="label label-default">2 years club</span>
                <span class="label label-primary">200 questions</span>
                <br>
                <span class="label label-success">400 answers</span>
                <span class="label label-info">10k user score </span>
              </div>
              <div class="col-xs-6 profile-topics">
                <label class="info-start">Most frequented topics</label> <br>
                <ul class="">
                  <li><a href="#">Programming</a></li>
                  <li><a href="#">Cooking</a></li>
                  <li><a href="#">Science</a></li>
                  <li><a href="#">Mathematics</a></li>
                </ul>
              </div>
            </div>

          </div>

            <hr>
        </div>

        <div class="col-lg-4 container-fluid profile-q-and-a">
          <div class="extras_suggested">
            <label class="related_label"> Submitted Questions </label>
            <ul class="list-group" >
              <li><a class="list-group-item suggestion" href="#">How to start up Bootstrap?<span class="badge">12</span></a></li>
              <li><a class="list-group-item suggestion" href="#">How to line divs in CSS?<span class="badge">30</span></a></li>
              <li><a class="list-group-item suggestion" href="#">HTML help?<span class="badge">1k</span></a></li>
              <li><a class="list-group-item suggestion" href="#">Can't center divs<span class="badge">59</span></a></li>
			  <li><a class="viewmore" href="#">View All questions</a></li>
            </ul>
          </div>
          <hr>
          <div class="extras_suggested">
            <label class="related_label"> Submitted Answers </label>
            <ul class="list-group" >
              <li><a class="list-group-item suggestion" href="#">Yes, you can charge your phone in the microwave. <span class="badge"></span></a></li>
              <li><a class="list-group-item suggestion" href="#">No that's illegal.<span class="badge"></span></a></li>
              <li><a class="list-group-item suggestion" href="#">How would i know.<span class="badge"></span></a></li>
              <li><a class="list-group-item suggestion" href="#">Yes cups are used for that too.<span class="badge"></span></a></li>
			  <li><a class="viewmore" href="#">View All Answers</a></li>
            </ul>
          </div>
          <hr>

        </div>
      </div>
    </div>