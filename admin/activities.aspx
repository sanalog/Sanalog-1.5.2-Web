<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="activities.aspx.cs" Inherits="admin_etkinlikler" %>


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
                    window.location.href = "activity-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&eid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">

    <div class="row etkinlikler">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.activities_aspx_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.activities_aspx_help %>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">

                    <a href="javascript:;" class="btn btn-info icon_duzenle"><%= Resources.admin_language.activities_aspx_edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.activities_aspx_delete %></a>
                    <a href="activity-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.activities_aspx_new %></a>

                </div>
            </div>

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.activities_aspx_list %></div>
                <div class="panel-body">

                    <asp:GridView ID="GVEtk" class="table table-bordered table-striped tbl" runat="server" AutoGenerateColumns="False" DataSourceID="SDSEtkinlikler"
                        GridLines="None" DataKeyNames="EtkinlikId" AllowPaging="True" AllowSorting="True"
                        PageSize="30" OnDataBound="GVEtk_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("EtkinlikId") %>" />
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

    <input type="hidden" name="HdnSil" />
    <asp:SqlDataSource ID="SDSEtkinlikler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT snlg_V1.TblEtkinlikApp.EtkinlikId, snlg_V1.TblEtkinlikDetay.Baslik FROM snlg_V1.TblEtkinlikApp INNER JOIN snlg_V1.TblEtkinlikDetay ON snlg_V1.TblEtkinlikApp.EtkinlikId = snlg_V1.TblEtkinlikDetay.EtkinlikId WHERE (snlg_V1.TblEtkinlikDetay.Dil = @DefaultLang) ORDER BY snlg_V1.TblEtkinlikApp.EtkinlikId DESC">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
