<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="reference-categories.aspx.cs" Inherits="admin_referanskategorileri" %>

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
                    window.location.href = "reference-category-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&ktgid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row referansKategorileri">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.ref_cat_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.ref_cat_help %></div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">


                    <a href="javascript:;" class="btn btn-warning icon_duzenle"><%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                    <a href="reference-category-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.add_new %></a>


                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>


            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.ref_cat_list %></div>
                <div class="panel-body">


                    <asp:GridView ID="GVKtg" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SDSKtg"
                        GridLines="None" DataKeyNames="KtgId" AllowPaging="True" AllowSorting="True"
                        OnDataBound="GVKtg_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("KtgId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="KtgAd" HeaderText="<%$ Resources:admin_language, article_cat_name %>" ReadOnly="True" ItemStyle-CssClass="baslik" />
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
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>



    <asp:SqlDataSource ID="SDSKtg" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_ReferansKtgSec" SelectCommandType="StoredProcedure">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnSil" />
</asp:Content>
