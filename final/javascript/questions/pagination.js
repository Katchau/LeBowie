let limit = 10;
let offset = 0;

function getMoreHotQuestions() {
    $.get(`${BASE_URL}api/questions/hot-questions?offset=${offset}&limit=${limit}`, function(data) {
        console.log(data);
        console.log(offset, limit);
        offset += limit;
    });
}