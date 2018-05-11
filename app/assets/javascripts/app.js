/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: "#app",
    data: {
      leads: [],
      leadFilter: "",
      time_format: "12/25/17",
      url: "https://www.google.com/",
      direction: true,
      order: "",
      amountLeads: { 
        actual: 100,
        before: 0
      }
    },
    mounted: function() {
      $.get("/api/v1/leads.json?" + $.param(this.amountLeads)).success(
        function(response) {
          console.log(this);
          response.forEach(function(lead) {
            lead.showEvents = false;
          });
          this.leads = response;
          this.leads = _.orderBy(this.leads, ["most_recent_event"], ["desc"]);
        }.bind(this)
      );
    },
    watch:{
      leadFilter: function() {
        $.get("/api/v1/leads.json?" + $.param( this.amountLeads) + '&filter='+ this.leadFilter).success(
          function(response) {
            this.leads = response;
            
          }.bind(this)
        );
      }
    },
    methods: {

      
      moment: function(date) {
        return moment(date);
      },
      showLeadEvents: function(lead) {
        var index = this.leads.indexOf(lead);
        lead.showEvents = !lead.showEvents;
        this.filteredLeads[index] = lead;
      },
      alphabetize: function(attr) {

        console.log(attr);
        // this.direction = this.direction ? "asc" : "desc";
        this.direction = !this.direction;
        // var leads = _.orderBy(this.leads, [attr], [this.direction]);
        // this.leads = leads;

        $.get("/api/v1/leads.json?" + $.param(this.amountLeads) + '&filter='+ this.leadFilter + '&direction=' + this.direction + '&sort=' + attr).success(
          function(response) {
            this.leads = this.leads.concat(response);
            console.log(response);
            console.log(this.leads);
          }.bind(this)
        );
      },
      zeroOutreach: function(lead) {
        if (lead.outreaches.length === 0) {
          return true;
        } else {
          return false;
        }
      },
      hotLead: function(lead) {
        if (this.zeroOutreach(lead)) {
          return "bg-warning";
        }

        var filterEvents = lead.events.filter(function(event) {
          return !!event;
        });

        var filterOutreaches = lead.outreaches.filter(function(outreach) {
          return !!outreach;
        });

        var sortDates = function(a, b) {
          var keyA = new Date(a.created_at),
            keyB = new Date(b.created_at);
          return keyB - keyA;
        };

        var sortEvents = filterEvents.sort(sortDates);
        var lastEventDate = sortEvents.length ? sortEvents[0].created_at : null;

        var sortOutreaches = filterOutreaches.sort(sortDates);
        var lastOutreachDate = sortOutreaches.length
          ? sortOutreaches[0].created_at
          : null;

        if (lastEventDate === null || lastOutreachDate === null) {
          return "";
        }

        var outreach = new Date(lastOutreachDate);
        var event = new Date(lastEventDate);

        if (event > outreach) {
          return "bg-info";
        } else {
          return "";
        }
      },
      autoText: function(lead) {
        $.post("/autotext.json", { id: lead.id }).done(function(data) {
          console.log(data);
          alert(data.message);
        });
      },
      loadMoreLeads: function() {
        this.amountLeads.before += this.amountLeads.actual;
        $.get("/api/v1/leads.json?" + $.param(this.amountLeads) + '&filter='+ this.leadFilter).success(
          function(response) {
            this.leads = this.leads.concat(response);
            console.log(response);
            console.log(this.leads);
          }.bind(this)
        );
      }
      
    },
    computed: {
      // filteredLeads: function() {
      //   return this.leads.filter(
      //     function(lead) {
      //       var filter = this.leadFilter.toLowerCase();
      //       if (
      //         lead.first_name.toLowerCase().includes(filter) ||
      //         lead.last_name.toLowerCase().includes(filter) ||
      //         lead.email.toLowerCase().includes(filter)
      //       ) {
      //         return lead;
      //       }
      //     }.bind(this)
      //   );
      // }
    }
  });
  // triggers when you are scrolling down at the end of the page
  $(window).scroll(function() {
    if ($(window).scrollTop() >= $(document).height() - $(window).height() ) {
      console.log("scrollTop:",$(window).scrollTop()," documentHeight:",$(document).height()," windowHeight:",$(window).height(),$(document).height() - $(window).height() );
      console.log("She wants to dance like Uman Thurman");
      app.loadMoreLeads();
    }
  });

});
