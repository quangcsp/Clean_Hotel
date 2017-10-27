/**
 * Created by isling on 14/10/2017.
 */
function showReview() {
    const ShowReview = new Vue({
        el: '#show-review',
        data: {
            is_write_cmt: false,
            comment: {},
            reply: {},
            comments: [],
        },
        mounted: function () {
            this.comment.user_id = $('textarea[name="comment"]').attr('data-current-user-id');
            this.fetchData();
        },
        methods: {
            fetchData: function () {
                let url = location.href;
                axios.get(url + '.json')
                    .then(res => {
                        console.log(res.data);
                    })
                    .catch(err => {

                    });
            },
            postComment: function () {
                let url = location.href + '.json';
                axios.post('url', this.comment)
                    .then(res => {
                        this.comment.content = '';
                        this.closeWriteCmtMode();
                    })
                    .catch(err => {
                    });
            },
            postReply: function (comment_id) {
                this.reply.comment_id = comment_id;
                console.log(this.reply);
            },
            deleteComment: function () {

            },
            deleteReply: function () {

            },
            openWriteCmtMode: function () {
                this.is_write_cmt = true;
            },
            closeWriteCmtMode: function () {
                this.is_write_cmt = false;
            },
        },
    });
}
