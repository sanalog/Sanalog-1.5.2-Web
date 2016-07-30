<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="references.aspx.cs" Inherits="admin_referanslar" %>

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
                    window.location.href = "reference-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&rid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row referanslar">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.ref_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.ref_help %>
            </div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                     <a href="javascript:;" runat="server" id="siralama" visible="false" class="btn btn-warning icon_order" onclick="SnlgGdvSiralama();"><%= Resources.admin_language.icon_sorting %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                    <a href="javascript:;" class="btn btn-warning icon_duzenle"><%= Resources.admin_language.edit %></a>
                    <a href="reference-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.add_new %></a>
                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.ref_list %></div>
                <div class="panel-body">

                    <label style="display: block; margin-bottom: 5px; font-weight: bold;">
                        <%= Resources.admin_language.article_aspx_cat %>
                    </label>
                    <div class="pageSelect mb-lg">
                        <p>
                            <asp:DropDownList ID="DDLKtg" CssClass="form-control" runat="server"  OnSelectedIndexChanged="DDLKtg_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </p>
                    </div>

                    <asp:GridView ID="GVResim" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="RId"
                        DataSourceID="SDSResim" GridLines="None" PageSize="30" AllowPaging="True" OnDataBound="GVResim_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("RId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Firma" HeaderText="<%$ Resources:admin_language, company_name %>" ItemStyle-CssClass="baslik" />
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
    <asp:SqlDataSource ID="SDSResim" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_Referanslar" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False"
        DeleteCommand="DELETE FROM snlg_V1.TblReferansApp WHERE (RId = @RId) "
        OnDeleted="SDSResim_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="RId" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter Name="KtgId" ControlID="DDLKtg" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnSil" />


      <div id="modalSnlgGdvSiralama" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                       <div class="modal-header">
                          <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title" id="myModalLabel"><%= Resources.admin_language.ref_title %>  </h4>
                        </div>
                       <div class="modal-body" style="height:600px;">
                            <div  style="width:100%; height:100%;">
                                   <asp:GridView ID="GrdSiralama" class="gdvSirala table table-bordered table-striped" runat="server"
                                    AutoGenerateColumns="False"
                                     DataKeyNames="RId">
                                    <Columns>
                                     <asp:TemplateField  ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <input type="hidden" name="id" value='<%# Eval("RId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                          <asp:BoundField DataField="Firma" HeaderText="<%$ Resources:admin_language, company_name %>" ItemStyle-CssClass="baslik" />
                                    </Columns>
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
                       <div class="modal-footer">
                            <asp:LinkButton  runat="server" ID="lnkBtnKaydet" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"  OnClick="lnkBtnKaydet_Click"></asp:LinkButton>
                      </div>
                  </div>
           </div>
       </div>
</asp:Content>
