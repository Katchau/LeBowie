let limitHot = 10;
let offsetHot = 10;
let atEndHot = false;

function getMoreHotQuestions() {
    $.get(BASE_URL + 'api/questions/hot-questions.php?offset=' + offsetHot + '&limit=' + limitHot, function(data, status, xhr) {
        console.log(xhr.status);
        if (xhr.status == 200) {
            offsetHot += limitHot;
            $('#hotq').append(data);
            $('#view-more').detach().appendTo('#hotq');
        } else if (!atEndHot) {
            $('#hotq').append("No more questions");
            $('#view-more').detach().appendTo('#hotq');
            atEndHot = true;
        }
    });
}