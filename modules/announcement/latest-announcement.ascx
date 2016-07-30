<%@ Control Language="C#" AutoEventWireup="true" CodeFile="latest-announcement.ascx.cs"
    Inherits="modules_duyuru_son_duyurular" %>
<div class="container">
    <div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
        <%= this.baslik %>
    </div>
    <div id="announcement-carousel" class="carousel slide vertical" data-ride="carousel">
        <!-- Indicators -->
       <!-- <ol class="carousel-indicators">
        </ol>-->

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <asp:Repeater runat="server" DataSourceID="SDS">
                <ItemTemplate>

                    <div class="item">

                        <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("announce") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                            <%# Eval("Baslik") %></a>

                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- Controls -->
       <!--  <a class="left carousel-control" href="#announcement-carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#announcement-carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a> -->
    </div>



</div>

<script>

    for (var i = 0; i < $("#announcement-carousel .item").length; i++) {
        if (i == 0)
            $("#announcement-carousel .carousel-indicators").append('<li data-target="#announcement-carousel" data-slide-to="' + i.toString() + '" class="active"></li>');
        else
            $("#announcement-carousel .carousel-indicators").append('<li data-target="#announcement-carousel" data-slide-to="' + i.toString() + '" ></li>');
    }


</script>

<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Duyuru_SonEklenen" SelectCommandType="StoredProcedure"
    OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="5" />
    </SelectParameters>
</asp:SqlDataSource>

