<%@ Control Language="C#" AutoEventWireup="true" CodeFile="events-calendar.ascx.cs" Inherits="modules__diger_etkinlik_takvimi_buyuk" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>


<div class="page-header">
    <div class="pull-right form-inline">
        <div class="btn-group">
            <button class="btn btn-primary btn-sm" type="button" data-calendar-nav="prev">Prev</button>
            <button class="btn btn-success btn-sm" type="button" data-calendar-nav="today">Today</button>
            <button class="btn btn-primary btn-sm" type="button" data-calendar-nav="next">Next</button>
        </div>
        <div class="btn-group">
            <button class="btn btn-warning btn-sm" type="button" data-calendar-view="year">Year</button>
            <button class="btn btn-warning btn-sm" type="button" data-calendar-view="month">Month</button>
            <button class="btn btn-warning btn-sm" type="button" data-calendar-view="week">Week</button>
            <button class="btn btn-warning btn-sm" type="button" data-calendar-view="day">Day</button>
        </div>
    </div>
    <h3></h3>
</div>

<div class="row">
    <div class="col-md-12">
        <div id="calendar"></div>
    </div>
</div>

<div class="clearfix"></div>
<br>
<br>
<div id="disqus_thread"></div>

<div class="modal fade" id="events-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title">Event</h3>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>


<link rel="stylesheet" href="/scripts/bootstrap-calendar-master/css/calendar.css">
<script type="text/javascript" src="/scripts/bootstrap-calendar-master/components/underscore/underscore-min.js"></script>
<script type="text/javascript" src="/scripts/bootstrap-calendar-master/components/jstimezonedetect/jstz.min.js"></script>
<script type="text/javascript" src="/scripts/bootstrap-calendar-master/js/language/<%= Request.RawUrl.Split('/')[1] %>.js"></script>
<script type="text/javascript" src="/scripts/bootstrap-calendar-master/js/calendar.js"></script>

<script type="text/javascript">


    (function ($) {

        var options = {
            modal_type: 'ajax',
            view: 'month',
            display_week_numbers: true,
            weekbox: true,
            modal: '#<%= UserControlClientID %> #events-modal',
            tmpl_path: '/scripts/bootstrap-calendar-master/tmpls/',
            language: '<%= Request.RawUrl.Split('/')[1] %>',
            tmpl_cache: false,
            events_source: '/services/Activities.ashx',
            onAfterEventsLoad: function (events) {
                if (!events) {
                    return;
                }
                var list = $('#<%= UserControlClientID %> #eventlist');
                list.html('');

                $.each(events, function (key, val) {
                    $(document.createElement('li'))
                        .html('<a href="' + val.url + '">' + val.title + '</a>')
                        .appendTo(list);
                });
            },
            onAfterViewLoad: function (view) {
                $('#<%= UserControlClientID %> .page-header h3').text(this.getTitle());
                $('#<%= UserControlClientID %> .btn-group button').removeClass('active');
                $('#<%= UserControlClientID %> button[data-calendar-view="' + view + '"]').addClass('active');
            },
            classes: {
                months: {
                    general: 'label'
                }
            }
        };

        var calendar = $('#<%= UserControlClientID %> #calendar').calendar(options);

        $('#<%= UserControlClientID %> .btn-group button[data-calendar-nav]').each(function () {
            var $this = $(this);
            $this.click(function () {
                calendar.navigate($this.data('calendar-nav'));
            });
        });

        $('#<%= UserControlClientID %> .btn-group button[data-calendar-view]').each(function () {
            var $this = $(this);
            $this.click(function () {
                calendar.view($this.data('calendar-view'));
            });
        });

        $('#<%= UserControlClientID %> #events-modal .modal-header, #<%= UserControlClientID %> #events-modal .modal-footer').click(function (e) {
            //e.preventDefault();
            //e.stopPropagation();
        });
    }(jQuery));


</script>

