<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="articles.aspx.cs" Inherits="admin_Makaleler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            $('body').on("click", ".table tr", function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
                }
            });

            $('body').on("click", ".icon_sil", function () {
                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });

            $('body').on("click", ".icon_duzenle", function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "article-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&makid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnSil" />
    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            $('.errors-in > div').remove();
            if (document.getElementById('<%= HdnHata.ClientID %>').value != "") {
                var hata = document.getElementById('<%= HdnHata.ClientID %>').value;
                var hataTur = document.getElementById('<%= HdnHataTur.ClientID %>').value;
                $('.errors-out').css('display', 'block');
                $('.errors-in').append('<div class="' + hataTur + '">' + hata + '</div>');
                document.getElementById('<%= HdnHata.ClientID %>').value = "";
                document.getElementById('<%= HdnHataTur.ClientID %>').value = "";
            }
        }
    </script>
    <div class="row makaleler">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.article_aspx_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.article_aspx_help %>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>
            <asp:HiddenField ID="HdnHata" runat="server" />
            <asp:HiddenField ID="HdnHataTur" runat="server" />
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-info icon_duzenle"><%= Resources.admin_language.article_aspx_edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.article_aspx_delete %></a>
                    <a href="article-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.article_aspx_new %></a>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.article_aspx_title %></div>
                <div class="panel-body">
                    <label>
                        <%= Resources.admin_language.article_aspx_cat %>
                    </label>
                    <p class="pageSelect mb-md">
                        <asp:DropDownList ID="DDLKtg" CssClass="form-control" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </p>
                    <asp:GridView ID="GVIcerikler" class="table table-bordered table-striped" runat="server"
                        AutoGenerateColumns="False" DataSourceID="SDSMakaleler"
                        AllowPaging="True" PageSize="30"
                        GridLines="None" AllowSorting="True" DataKeyNames="MakId"
                        OnDataBound="GVIcerikler_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("MakId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Baslik" SortExpression="Baslik" HeaderText="<%$ Resources:admin_language, heading %>" ReadOnly="True"
                                ItemStyle-CssClass="baslik" HeaderStyle-CssClass="baslik" />
                        </Columns>
                        <PagerTemplate>
                            <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                        </PagerTemplate>
                        <RowStyle CssClass="satir" />
                        <AlternatingRowStyle CssClass="aSatir" />
                        <EditRowStyle CssClass="eSatir" />
                        <SelectedRowStyle CssClass="seciliSatir" />
                        <HeaderStyle CssClass="baslikSatir" />
                        <SortedAscendingHeaderStyle CssClass="artan" />
                        <SortedDescendingHeaderStyle CssClass="azalan" />
                        <SortedAscendingCellStyle CssClass="artan" />
                        <SortedDescendingCellStyle CssClass="azalan" />
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SDSMakaleler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_Makaleler" SelectCommandType="StoredProcedure"
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter Name="KtgId" ControlID="DDLKtg" Type="Int32" />
            <asp:SessionParameter Name="YazarId" Type="Int32" SessionField="UserId" />
            <asp:Parameter Name="AdminId" Type="Int32" DefaultValue="<%$ AppSettings:AdminId %>" />
        </SelectParameters>
    </asp:SqlDataSource>


   
</asp:Content>
