let limit = 10;
let offset = 10;

function getMoreHotQuestions() {
    $.get(BASE_URL + 'api/questions/hot-questions.php?offset=' + offset + '&limit=' + limit, function(data) {
        offset += limit;
        
        $('#hotq').append(data);
        $('#view-more').detach().appendTo('#hotq');
    });
}