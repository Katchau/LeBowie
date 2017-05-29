let limitHot = 10;
let offsetHot = 10;
let atEndHot = false;

let limitNew = 10;
let offsetNew = 10;
let atEndNew = false;

let limitBest = 10;
let offsetBest = 10;
let atEndBest = false;

function getMoreHotQuestions() {
    $.get(BASE_URL + 'api/questions/hot-questions.php?offset=' + offsetHot + '&limit=' + limitHot, function(data, status, xhr) {
        if (xhr.status == 200) {
            offsetHot += limitHot;
            $('#hotq').append(data);
            $('#view-more').detach().appendTo('#hotq');
        } else if (!atEndHot) {
            $('#hotq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more').detach().appendTo('#hotq');
            atEndHot = true;
        }
    });
}

function getMoreNewQuestions() {
    $.get(BASE_URL + 'api/questions/new-questions.php?offset=' + offsetNew + '&limit=' + limitNew, function(data, status, xhr) {
        if (xhr.status == 200) {
            offsetNew += limitNew;
            $('#hotq').append(data);
            $('#view-more').detach().appendTo('#hotq');
        } else if (!atEndNew) {
            $('#hotq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more').detach().appendTo('#hotq');
            atEndNew = true;
        }
    });
}

function getMoreBestQuestions() {
    $.get(BASE_URL + 'api/questions/best-questions.php?offset=' + offsetBest + '&limit=' + limitBest, function(data, status, xhr) {
        if (xhr.status == 200) {
            offsetBest += limitBest;
            $('#hotq').append(data);
            $('#view-more').detach().appendTo('#hotq');
        } else if (!atEndBest) {
            $('#hotq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more').detach().appendTo('#hotq');
            atEndBest = true;
        }
    });
}