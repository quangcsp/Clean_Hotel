/**
 * Created by isling on 14/10/2017.
 */
function showReview() {
    const ShowReview = new Vue({
        el: '#show-review',
        data: {
            is_write_cmt: false,
            comment: {},
            comments: [],
        },
        mounted: function () {
            this.comment.user_id = $('textarea[name="comment"]').attr('data-current-user-id');
            this.comment.review_id = $('textarea[name="comment"]').attr('data-review-id');
        },
        methods: {
            openWriteCmtMode: function () {
                this.is_write_cmt = true;
            },
            closeWriteCmtMode: function () {
                this.is_write_cmt = false;
            },
            postComment: function () {
                console.log(this.comment);
                this.comment.content = '';
                this.closeWriteCmtMode();
            },
        },
    });
}
