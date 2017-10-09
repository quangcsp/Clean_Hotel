$(
    function () {
        $('#dang-bai').click(function () {
            let title = $('#review-editable-title').text();
            let content = $('#review-editable-content').html();
            let data = {
                title: title,
                content: content,
            };
            console.log(JSON.stringify(data));
        });
    },
);