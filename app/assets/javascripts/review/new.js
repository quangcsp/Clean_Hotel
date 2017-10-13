/**
 * Created by isling on 12/10/2017.
 */
function newReview() {
    const WriteReview = new Vue({
        el: '#write-review',
        data: {
            hotel_id: -1,
            hotelValue: '',
            hotelData: [{}],
            rate: 0,
        },
        mounted: function () {
            this.fetchHotel();
        },
        methods: {
            hotelFilter: function (list, query) {
                let arr = [];

                for (let i = 0; i < list.length; i++) {
                    if (list[i].name.indexOf(query) !== -1)
                        arr.push(list[i]);

                    if (arr.length > 5)
                        break;
                }

                return arr;
            },

            hotelCallback: function (item) {
                this.hotel_id = item.id;
            },

            fetchHotel: function () {
                axios.get('/hotels.json')
                    .then(res => {
                        console.log(res.data);
                        this.hotelData = res.data;
                    })
                    .catch(err => {

                    });
            },

            formatHotelData: function (data) {
                let formated_data = [];
                data.forEach(item => {
                    formated_data.push({
                        name: item.name + ' ・ ' + item.address,
                        id: item.id,
                    });
                });
                return formated_data;
            },
        },
    });
}
