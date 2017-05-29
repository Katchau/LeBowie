let limit = 10;
let offset = 0;

function getMoreHotQuestions() {
    $.get(`${BASE_URL}api/questions/hot-questions.php?offset=${offset}&limit=${limit}`, function(data) {
        offset += limit;

        data.forEach(function(element) {
            $('#hotq').append(`<div>${element.title}<div>`);
        }, this);

        $('#view-more').detach().appendTo('#hotq');
    }, 'json');
}