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
            $('#view-more-hot').detach().appendTo('#hotq');
        } else if (!atEndHot) {
            $('#hotq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more-hot').detach().appendTo('#hotq');
            atEndHot = true;
        }
    });
}

function getMoreNewQuestions() {
    $.get(BASE_URL + 'api/questions/new-questions.php?offset=' + offsetNew + '&limit=' + limitNew, function(data, status, xhr) {
        if (xhr.status == 200) {
            offsetNew += limitNew;
            $('#newq').append(data);
            $('#view-more-new').detach().appendTo('#newq');
        } else if (!atEndNew) {
            $('#newq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more-new').detach().appendTo('#newq');
            atEndNew = true;
        }
    });
}

function getMoreBestQuestions() {
    $.get(BASE_URL + 'api/questions/best-questions.php?offset=' + offsetBest + '&limit=' + limitBest, function(data, status, xhr) {
        if (xhr.status == 200) {
            offsetBest += limitBest;
            $('#bestq').append(data);
            $('#view-more-best').detach().appendTo('#bestq');
        } else if (!atEndBest) {
            $('#bestq').append('<div class="col-lg-8" style="padding: 10px;"> No more questions </div>');
            $('#view-more-best').detach().appendTo('#bestq');
            atEndBest = true;
        }
    });
}