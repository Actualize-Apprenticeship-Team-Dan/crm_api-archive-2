/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: "#app",
    data: {
      leads: [],
      leadFilter: "",
      time_format: "12/25/17",
      url: "https://www.google.com/"
    },
    mounted: function() {
      $.get("/api/v1/leads.json").success(
        function(response) {
          console.log(this);
          this.leads = response;
        }.bind(this)
      );
    },
    methods: {
      moment: function(date) {
        return moment(date);
      }
    },
    computed: {
      filteredLeads: function() {
        return this.leads.filter(
          function(lead) {
            var filter = this.leadFilter.toLowerCase();
            if (
              lead.first_name.toLowerCase().includes(filter) ||
              lead.last_name.toLowerCase().includes(filter) ||
              lead.email.toLowerCase().includes(filter)
            ) {
              return lead;
            }
          }.bind(this)
        );
      }
    }
  });
});
