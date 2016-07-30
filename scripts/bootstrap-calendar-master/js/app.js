(function ($) {

    "use strict";

    var options = {
        modal_type: 'ajax',
        view: 'month',
        display_week_numbers: true,
        weekbox: true,
        modal: '#events-modal',
        tmpl_path: '/scripts/bootstrap-calendar-master/tmpls/',
        language: "tr",
        tmpl_cache: false,
        events_source: '/events.json',
        onAfterEventsLoad: function (events) {
            if (!events) {
                return;
            }
            var list = $('#eventlist');
            list.html('');

            $.each(events, function (key, val) {
                $(document.createElement('li'))
					.html('<a href="' + val.url + '">' + val.title + '</a>')
					.appendTo(list);
            });
        },
        onAfterViewLoad: function (view) {
            $('.page-header h3').text(this.getTitle());
            $('.btn-group button').removeClass('active');
            $('button[data-calendar-view="' + view + '"]').addClass('active');
        },
        classes: {
            months: {
                general: 'label'
            }
        }
    };

    var calendar = $('#calendar').calendar(options);

    $('.btn-group button[data-calendar-nav]').each(function () {
        var $this = $(this);
        $this.click(function () {
            calendar.navigate($this.data('calendar-nav'));
        });
    });

    $('.btn-group button[data-calendar-view]').each(function () {
        var $this = $(this);
        $this.click(function () {
            calendar.view($this.data('calendar-view'));
        });
    });

    $('#events-modal .modal-header, #events-modal .modal-footer').click(function (e) {
        //e.preventDefault();
        //e.stopPropagation();
    });
}(jQuery));