<%@ Control Language="C#" AutoEventWireup="true" CodeFile="comments.ascx.cs"
    Inherits="modules_modules_z_defteri_yorumlar" %>

 <div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
        <%= this.baslik %>
    </div>

<div id="comments" class="comments">
   

    <div class="DivZYorumlar">
    </div>

</div>

<asp:Literal ID="LtrSayfalama" runat="server" />

<script type="text/javascript">
    var isvalid_Zyorumlar_ascx = true;

    ZDefteriYorumlariGetir(1);
    //yorumların sayfalama linkleri ayarlanıyor
    $('#<%= UserControlClientID %> .pager a').attr('href', '#');
    $('#<%= UserControlClientID %> .pager a:first').addClass('current');
    $('#<%= UserControlClientID %> .pager a').click(function (event) {
        ZDefteriYorumlariGetir($(this).text());
        $('#<%= UserControlClientID %> .pager a').removeClass('current');
        $(this).addClass('current');
        event.preventDefault();
    });

    function ZDefteriYorumlariGetir(currentPage) {
        $.ajax({
            type: "POST",
            url: "/services/guestbook.asmx/Yorumlar", //web service ve methodumuz
            data: '{ "currentPage":' + currentPage + ',"PageSize":<%= this.PageSize %>}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#<%= UserControlClientID %> .DivZYorumlar').empty();
                $('#<%= UserControlClientID %> .DivZYorumlar').append(data.d);
            },
            error: function () {
            }
        });
    }

</script>
